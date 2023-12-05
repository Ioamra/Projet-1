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
        // Récupération des utilisateur par page
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
        // Suppression d'un utilisateur
        } else if ($data->action == "delete-user" && !empty($data->id_user)) {
            session_start();
            if ($_SESSION['role'] == 1) {
                $req = $bdd->prepare("DELETE FROM user WHERE id_user = :id_user");
                $req->bindParam(':id_user', $data->id_user, PDO::PARAM_STR);
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