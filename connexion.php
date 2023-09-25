<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Connexion</title>
    <?php require_once 'includes/head.php'; ?>
    <link rel="stylesheet" href="assets/scss/connexion.scss">
</head>
<body>
    <?php require_once 'includes/bdd.php'; 
    require_once 'includes/nav.php';

    if(isset($_POST['mail'])){
        var_dump($_POST);
        $mail = $_POST['mail'];
        $mdp = sha1($_POST['password']);

        $req_co = "SELECT mail, mdp FROM user WHERE mail = '$mail' AND mdp = '$mdp'";
        $co = $bdd->prepare($req_co);
        $co->execute();
        $user_exist = $co->rowCount();
        
        if($user_exist == 1){
            $req = $bdd->prepare("SELECT id FROM user WHERE mail = '$mail'");
            $req->execute();
            $data = $req->fetch(\PDO::FETCH_OBJ);
            $id =  $data->id;
    
            session_start();
            $_SESSION['id'] = $id;
            // $_SESSION['mail'] = $mail;
            header("location:index.php");

        }
    }   
    ?>
    <form method="post" class="container text-center">
        <label class="w-100 mb-1 d-block" for="mail">Mail</label>
        <input class="w-100 mb-1" type="email" name="mail">
        <label class="w-100 mb-1 d-block" for="password">Mot de passe</label>
        <input class="w-100 mb-2" type="password" name="password">
        <button class="w-100 mb-2" type="submit" name="submit">Se connecter</button>
        <a href="inscription.php">Vous n'avez pas de compte, inscrivez-vous !</a>
    </form>
</body>
</html>