<?php
require_once 'includes/bdd.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'));
    if ($data->action) {
        if ($data->action == "add-comment") {
            if ($data->id_topic && $data->id_user && $data->comment) {
                date_default_timezone_set('Europe/Paris');
                $date = date('d/m/Y H:i');
                $req = $bdd->prepare('INSERT INTO comment (content_comment, date_comment, id_topic, id_user) 
                                    VALUES (:content_comment, :date_comment, :id_topic, :id_user)');
                $req->bindParam(':content_comment', $data->comment, PDO::PARAM_STR);
                $req->bindParam(':date_comment', $date, PDO::PARAM_STR);
                $req->bindParam(':id_topic', $data->id_topic, PDO::PARAM_INT);
                $req->bindParam(':id_user', $data->id_user, PDO::PARAM_INT);
                if ($req->execute()) {
                    echo json_encode(['success' => true]);
                } else {
                    echo json_encode(['success' => false]);
                }
            } else {
                echo json_encode(['success' => false]);
            }
        } else if ($data->action == "get-comments") {
            if ($data->id_topic) {
                $req = $bdd->prepare('SELECT content_comment, date_comment, pseudo_user FROM comment INNER JOIN user ON comment.id_user = user.id_user 
                                    WHERE id_topic = '.$data->id_topic.' ORDER BY STR_TO_DATE(date_comment, "%d/%m/%Y %H:%i") ASC');
                $req->execute();
                $data = $req->fetchAll(PDO::FETCH_ASSOC);
                echo json_encode(['success' => true, 'data' => $data]);
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