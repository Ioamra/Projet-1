<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Connexion</title>
    <?php require_once 'includes/head.php'; ?>
    <link rel="stylesheet" href="assets/scss/connexion.scss">
</head>
<body>
    <?php require_once 'includes/bdd.php'; ?>
    <form method="post" class="container text-center">
        <label class="w-100 d-block" for="mail">Mail</label>
        <input class="w-100" type="email" name="mail">
        <label class="w-100 d-block" for="password">Mot de passe</label>
        <input class="w-100" type="password" name="password">
        <button class="w-100" type="submit">Se connecter</button>
        <a href="inscription.php">Vous n'avez pas de compte, inscrivez-vous !</a>
    </form>
</body>
</html>