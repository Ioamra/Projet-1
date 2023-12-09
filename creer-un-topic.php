<?php
session_start();
empty($_SESSION['id']) && header("location:connexion.php");

require_once 'includes/bdd.php';
$mes_error = "";
if (isset($_POST['submit'])) {
    $title = $_POST['title'];
    $message = $_POST['message'];

    $validation = true;

    // Verif que le titre ne fait pas plus de 255 caractères (limite bdd)
    if (strlen($title) > 255) {
        $validation = False;
        $mes_error = "<br/>Le titre ne peut pas avoir plus de 255 caractères.";
    }
    
    if ($validation) {
        date_default_timezone_set('Europe/Paris');
        $date = date('d/m/Y H:i');
        
        $req = $bdd->prepare("INSERT INTO topic (title_topic, message_topic, date_topic, id_user) VALUES (:title, :message, :date, :id_user)");
        $req->bindParam(':title', $title, PDO::PARAM_STR);
        $req->bindParam(':message', $message, PDO::PARAM_STR);
        $req->bindParam(':date', $date, PDO::PARAM_STR);
        $req->bindParam(':id_user', $_SESSION['id'], PDO::PARAM_INT);
        $req->execute();
        $title = "";
        $message = "";
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Natter - Page d'acceuil</title>
    <meta name="description" content="Créez votre topic sur Natter : partagez vos idées et lancez des discussions captivantes en quelques clics !">
    <?php require_once 'includes/head.php'; ?>
    <link rel="stylesheet" href="assets/css/creer-un-topic.css">
</head>
<body>
    <?php
    require_once 'includes/nav.php';
    require_once 'includes/btn-return-top.php';
    ?>
    <main>
        <form method="post" class="card-container">
            <h2>Creer un nouveau topic</h2>
            <label for="title">Titre</label>
            <input id="title" name="title" type="text" value="<?php if (isset($title)) {echo $title;} ?>" pattern="{0,255}" required>
            <label for="message">Message</label>
            <textarea id="message" name="message" rows="15" value="<?php if (isset($message)) {echo $message;} ?>" required></textarea>
            <button type="submit" name="submit">Valider</button>
            <p class="error"><?=$mes_error?></p>
        </form>
    </main>
    <?php require_once "includes/footer.php" ?>
</body>
</html>