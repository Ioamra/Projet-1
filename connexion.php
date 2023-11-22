<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Connexion</title>
    <?php require_once 'includes/head.php'; ?>
    <meta name="description" content="Connectez-vous à notre forum pour participer à des discussions passionnantes, poser des questions, et partager vos connaissances avec la communauté.">
    <link rel="stylesheet" href="assets/css/login.css">
</head>
<body>
    <?php 
    require_once 'includes/bdd.php'; 
    require_once 'includes/nav.php';
    require_once 'includes/btn-return-top.php';

    $mes_error = "";
    if(isset($_POST['submit'])){
        $mail = $_POST['mail'];
        $password = hash('sha256', $_POST['password']);

        $req = $bdd->prepare("SELECT id_user FROM user WHERE mail = :mail AND password = :password");
        $req->bindParam('mail', $mail, PDO::PARAM_STR);
        $req->bindParam('password', $password, PDO::PARAM_STR);
        $req->execute();
        
        if($req->rowCount() == 1){
            $req = $bdd->prepare("SELECT id_user FROM user WHERE mail = '$mail'");
            $req->execute();
            $data_user = $req->fetch(\PDO::FETCH_OBJ);
    
            session_start();
            $_SESSION['id'] = $data_user->id_user;
            header("location:index.php");
        } else {
            $mes_error = "Identifiant ou mot de passe invalide.";
        }
    }   
    ?>
    <section class="container">
        <section class="card">
            <form method="post">
                <h2 class="mt-0">Connexion</h2>
                <label class="w-100 d-block" for="mail">Mail</label>
                <input class="w-100" id="mail" type="email" name="mail" required>
                <label class="w-100 d-block" for="password">Mot de passe</label>
                <input class="w-100" id="password" type="password" name="password" required>
                <button class="w-100" type="submit" name="submit">Se connecter</button>
                <a href="inscription.php">Vous n'avez pas de compte, inscrivez-vous !</a>
                <p class="error"><?=$mes_error?></p>
            </form>
        </section>
    </section>
</body>
</html>