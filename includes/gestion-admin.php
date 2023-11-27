<?php
$req = $bdd->prepare("SELECT mail_user, pseudo_user, role_user FROM user");
$req->execute();
$list_user = $req->fetchAll(PDO::FETCH_ASSOC);

?>