<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Page d'acceuil</title>
    <meta name="description" content="Page d'acceuil du forum">
    <?php require_once 'includes/head.php'; ?>
</head>
<body>
    <?php
    session_start();
    require_once 'includes/bdd.php';
    require_once 'includes/nav.php';
    require_once 'includes/btn-return-top.php';
    var_dump($_SESSION);
    ?>

</body>
</html>