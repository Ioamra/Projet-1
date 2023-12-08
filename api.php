<?php
require_once 'includes/bdd.php';
require_once 'includes/functions/format-date-diff.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'));
    if ($data->action) {
        // Ajout d'un commentaire
        if ($data->action == "add-comment" && !empty($data->id_topic) && !empty($data->id_user) && !empty($data->comment)) {
            date_default_timezone_set('Europe/Paris');
            $date = date('d/m/Y H:i');
            $req = $bdd->prepare('INSERT INTO comment (content_comment, date_comment, id_topic, id_user) 
                                VALUES (:content_comment, :date_comment, :id_topic, :id_user)');
            $req->bindParam(':content_comment', $data->comment, PDO::PARAM_STR);
            $req->bindParam(':date_comment', $date, PDO::PARAM_STR);
            $req->bindParam(':id_topic', $data->id_topic, PDO::PARAM_INT);
            $req->bindParam(':id_user', $data->id_user, PDO::PARAM_INT);
            $req->execute();
            echo json_encode(['success' => true]);
        // Récupération des commentaires d'un topic
        } else if ($data->action == "get-comments" && !empty($data->id_topic)) {
            $req = $bdd->prepare('SELECT content_comment, date_comment, pseudo_user FROM comment INNER JOIN user ON comment.id_user = user.id_user 
                                WHERE id_topic = '.$data->id_topic.' ORDER BY STR_TO_DATE(date_comment, "%d/%m/%Y %H:%i") ASC');
            $req->execute();
            $data = $req->fetchAll(PDO::FETCH_ASSOC);
            for ($i=0; $i < count($data); $i++) { 
                $data[$i]['date_comment'] = formatDateDiff($data[$i]['date_comment']);
            }
            echo json_encode(['success' => true, 'data' => $data]);
        // Récupération du nombre d'utilisateur
        } else if ($data->action == "get-nb-users") {
            $req = $bdd->prepare("SELECT COUNT(id_user) FROM user");
            $req->execute();
            $data = $req->fetch();
            echo json_encode(['success' => true, 'data' => $data]);
        // Récupération des utilisateurs par page
        } else if ($data->action == "get-users" && !empty($data->limit) && (!empty($data->offset) || $data->offset == 0)) {
            session_start();
            if ($_SESSION['role'] == 1) {
                $req = $bdd->prepare("SELECT id_user, mail_user, pseudo_user, role_user FROM user LIMIT $data->limit OFFSET $data->offset");
                $req->execute();
                $data = $req->fetchAll(PDO::FETCH_ASSOC);
                echo json_encode(['success' => true, 'data' => $data]);
            } else {
                echo json_encode(['success' => false]);
            }
        // Suppression d'un utilisateur et de tous ses topics et commentaires et des commentaires des topics supprimé
        } else if ($data->action == "delete-user" && !empty($data->id_user)) {
            session_start();
            if ($_SESSION['role'] == 1) {
                $req = $bdd->prepare("DELETE FROM comment WHERE id_user = :id_user");
                $req->bindParam(':id_user', $data->id_user, PDO::PARAM_STR);
                $req->execute();
                $req = $bdd->prepare("SELECT id_topic FROM topic WHERE id_user = :id_user");
                $req->bindParam(':id_user', $data->id_user, PDO::PARAM_STR);
                $req->execute();
                $list_id_topic = $req->fetchAll(PDO::FETCH_ASSOC);
                foreach ($list_id_topic as $key => $value) {
                    $req = $bdd->prepare("DELETE FROM comment WHERE id_topic = :id_topic");
                    $req->bindParam(':id_topic', $list_id_topic[$key], PDO::PARAM_STR);
                    $req->execute();
                }
                $req = $bdd->prepare("DELETE FROM topic WHERE id_user = :id_user");
                $req->bindParam(':id_user', $data->id_user, PDO::PARAM_STR);
                $req->execute();
                $req = $bdd->prepare("DELETE FROM user WHERE id_user = :id_user");
                $req->bindParam(':id_user', $data->id_user, PDO::PARAM_STR);
                $req->execute();
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false]);
            }
        // Modification du role d'un utilisateur, admin devient user et user devient admin
        } else if ($data->action == "change-user-role" && !empty($data->id_user) && (!empty($data->role_user) || $data->role_user == 0)) {
            session_start();
            if ($_SESSION['role'] == 1) {
                $req = $bdd->prepare("UPDATE user SET role_user = :role_user WHERE id_user = :id_user");
                $newRole = !$data->role_user;
                $req->bindParam(':role_user', $newRole, PDO::PARAM_INT);
                $req->bindParam(':id_user', $data->id_user, PDO::PARAM_INT);
                $req->execute();
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false]);
            }
        // Récupération du nombre de topics
        } else if ($data->action == "get-nb-topics") {
            $req = $bdd->prepare("SELECT COUNT(id_topic) FROM topic");
            $req->execute();
            $data = $req->fetch();
            echo json_encode(['success' => true, 'data' => $data]);
        // Récupération des topics par page
        } else if ($data->action == "get-topics" && !empty($data->limit) && (!empty($data->offset) || $data->offset == 0)) {
            session_start();
            if ($_SESSION['role'] == 1) {
                $req = $bdd->prepare("SELECT id_topic, title_topic, message_topic, date_topic, pseudo_user FROM topic 
                                    INNER JOIN user ON topic.id_user = user.id_user LIMIT $data->limit OFFSET $data->offset");
                $req->execute();
                $data = $req->fetchAll(PDO::FETCH_ASSOC);
                echo json_encode(['success' => true, 'data' => $data]);
            } else {
                echo json_encode(['success' => false]);
            }
        // Suppression d'un topic et de tous les commentaires assossier
        } else if ($data->action == "delete-topic" && !empty($data->id_topic)) {
            session_start();
            if ($_SESSION['role'] == 1) {
                $req = $bdd->prepare("DELETE FROM comment WHERE id_topic = :id_topic");
                $req->bindParam(':id_topic', $data->id_topic, PDO::PARAM_STR);
                $req->execute();
                $req = $bdd->prepare("DELETE FROM topic WHERE id_topic = :id_topic");
                $req->bindParam(':id_topic', $data->id_topic, PDO::PARAM_STR);
                $req->execute();
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false]);
            }
        // Récupération du nombre de commentaires
        } else if ($data->action == "get-nb-comments") {
            $req = $bdd->prepare("SELECT COUNT(id_comment) FROM comment");
            $req->execute();
            $data = $req->fetch();
            echo json_encode(['success' => true, 'data' => $data]);
        // Récupération des commentaires par page
        } else if ($data->action == "get-comments" && !empty($data->limit) && (!empty($data->offset) || $data->offset == 0)) {
            session_start();
            if ($_SESSION['role'] == 1) {
                $req = $bdd->prepare("SELECT id_comment, content_comment, date_comment, title_topic, pseudo_user FROM comment 
                                    INNER JOIN topic ON comment.id_topic = topic.id_topic INNER JOIN user ON comment.id_user = user.id_user 
                                    LIMIT $data->limit OFFSET $data->offset");
                $req->execute();
                $data = $req->fetchAll(PDO::FETCH_ASSOC);
                echo json_encode(['success' => true, 'data' => $data]);
            } else {
                echo json_encode(['success' => false]);
            }
        // Suppression d'un commentaire
        } else if ($data->action == "delete-comment" && !empty($data->id_comment)) {
            session_start();
            if ($_SESSION['role'] == 1) {
                $req = $bdd->prepare("DELETE FROM comment WHERE id_comment = :id_comment");
                $req->bindParam(':id_comment', $data->id_comment, PDO::PARAM_STR);
                $req->execute();
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false]);
            }


        } else {
            echo json_encode(['success' => false]);
        }
    } else {
        echo json_encode(['success' => false]);
    }
} else {
    echo json_encode(['success' => false]);
}
?>