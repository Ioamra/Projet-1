<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Page d'acceuil</title>
    <?php require_once 'includes/head.php'; ?>
</head>
<body>
    <?php require_once 'includes/bdd.php'; 
    session_start();
    ?>
    <a href="connexion">connexion</a>
    <a href="inscription">inscription</a>
    <a href="logout">logout</a>
</body>
</html>