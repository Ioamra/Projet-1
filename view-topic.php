<?php
    session_start();
    empty($_GET['id']) || empty($_SESSION['id']) && header("location:index.php");
    require_once 'includes/bdd.php';
    require_once 'includes/functions/format-date-diff.php';
    require_once 'includes/functions/limit-content.php';
    
    $req = $bdd->prepare("SELECT title_topic, message_topic, date_topic, pseudo_user FROM topic INNER JOIN user ON topic.id_user = user.id_user");
    $req->execute();
    $list_topic = $req->fetchAll();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title></title>
    <meta name="description" content="">
    <?php require_once 'includes/head.php'; ?>
    <link rel="stylesheet" href="assets/css/home.css">
</head>
<body>
    <?php
    require_once 'includes/nav.php';
    require_once 'includes/btn-return-top.php';
    ?>

</body>
</html>