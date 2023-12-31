<?php
require_once 'includes/bdd.php'; 
$mes_error = "";
if (isset($_POST['submit'])) {
    $mail = $_POST['mail'];
    $pseudo = $_POST['pseudo'];
    $password = hash('sha256', $_POST['password']);

    $validation = true;

    // Verif que pseudo n'a pas plus de 16 caractères (limite bdd)
    if (strlen($pseudo) < 3 || strlen($pseudo) > 16) {
        $validation = False;
        $mes_error = "<br/>Le pseudo doit avoir entre 3 et 16 caractères.";
        $pseudo = "";
    }
    // Verif que mail n'a pas plus de 320 caractères (limite bdd)
    if (strlen($mail) > 320) {
        $validation = False;
        $mes_error = "<br/>Votre adresse mail ne peut pas avoir plus de 320 caractères.";
        $mail = "";
    }
    // Verif que mail est bien une adresse mail
    if (!filter_var($mail, FILTER_VALIDATE_EMAIL)) {
        $validation = False;
        $mes_error = "<br/>Veuillez entrer une adresse email valide.";
        $mail = "";
    }
    // Verif que les mots de passe sont identique
    if ($_POST['password'] != $_POST['password-confirm']) {
        $validation = false;
    }
    // Verif que le mail n'est pas déjà utilisé
    $req = $bdd->prepare("SELECT id_user FROM user WHERE mail_user = '$mail'");
    $req->execute();
    if ($req->rowCount() > 0) {
        $validation = False;
        $mes_error = '<br/>Cette adresse mail est déjà utilisé.';
        $mail = "";
    }
    // Verif que le pseudo n'est pas déjà utilisé
    $req = $bdd->prepare("SELECT id_user FROM user WHERE pseudo_user = '$pseudo'");
    $req->execute();
    if ($req->rowCount() > 0) {
        $validation = False;
        $mes_error = '<br/>Ce pseudo est déjà utilisé.';
        $pseudo = "";
    }

    if ($validation) {
        $req = $bdd->prepare("INSERT INTO user (mail_user, pseudo_user, password_user) VALUES (:mail, :pseudo, :password)");
        $req->bindParam(':mail', $mail, PDO::PARAM_STR);
        $req->bindParam(':pseudo', $pseudo, PDO::PARAM_STR);
        $req->bindParam(':password', $password, PDO::PARAM_STR);
        $req->execute();

        session_start();
        $_SESSION['id'] = $bdd->lastInsertId();
        $_SESSION['role'] = 0;
        header("location:index.php");
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Natter - Inscription</title>
    <meta name="description" content="Rejoignez notre forum en vous inscrivant dès maintenant. Profitez d'une communauté dynamique où vous pouvez partager vos connaissances et poser des questions.">
    <?php require_once 'includes/head.php'; ?>
    <link rel="stylesheet" href="assets/css/login.css">
</head>
<body>
    <?php
    require_once 'includes/nav.php';
    require_once 'includes/btn-return-top.php';
    ?>
    <main>
        <section class="card-container">
            <form method="post">
                <h2 class="mt-0">Inscription</h2>
                <label for="mail">Mail</label>
                <input id="mail" type="email" name="mail" value="<?php if (isset($mail)) {echo $mail;} ?>" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}" required>
                <label for="pseudo">Pseudo</label>
                <input id="pseudo" type="text" name="pseudo" value="<?php if (isset($pseudo)) {echo $pseudo;} ?>" pattern="{3, 16}" required>
                <label for="password">Mot de passe</label>
                <input id="password" type="password" name="password" required>
                <label for="password-confirm">Confirmation du mot de passe</label>
                <input id="password-confirm" type="password" name="password-confirm" required>
                <button type="submit" name="submit">S'inscrire</button>
                <a href="connexion.php">Vous avez un compte, connectez-vous !</a>
                <p class="error"><?=$mes_error?></p>
            </form>
        </section>
    </main>
    <?php require_once "includes/footer.php" ?>
</body>
</html>