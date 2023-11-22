    <?php
    session_start();
    require_once 'includes/bdd.php';
    require_once 'includes/nav.php';
    require_once 'includes/btn-return-top.php';
    require_once 'includes/functions/format-date-diff.php';
    require_once 'includes/functions/limit-content.php';
    
    // $req = $bdd->prepare("SELECT id_topic, title, message, creation_date, pseudo FROM topic INNER JOIN user ON topic.id_user = user.id_user");
    // $req->execute();
    // $list_topic = $req->fetchAll();
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

</body>
</html>