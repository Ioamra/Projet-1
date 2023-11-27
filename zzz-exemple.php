<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Administration</title>
    <?php require_once 'includes/head.php'; ?>
    <link rel="stylesheet" href="assets/css/admin.css">
</head>
<body>
    <?php
    session_start();
    $_SESSION['id'] != 1 && header("location:index.php");
    require_once 'includes/bdd.php';
    require_once 'includes/nav.php';
    require_once 'includes/btn-return-top.php';
    ?>
    
</body>
</html>