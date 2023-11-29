<?php
    session_start();
    $_SESSION['id'] != 1 && header("location:index.php");
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Administration</title>
    <?php require_once 'includes/head.php'; ?>
    <link rel="stylesheet" href="assets/css/admin.css">
    <script src="assets/js/admin.js"></script>
</head>
<body onload="getUsers(1, 10)">
    <?php
    require_once 'includes/bdd.php';
    require_once 'includes/nav.php';
    require_once 'includes/btn-return-top.php';
    ?>
    
    <section class="card-container">
        <article>
            <button id="dropdown-btn-user" class="dropdown-btn">Utilisateur</button>
            <section id="dropdown-content-user" class="dropdown-content">
                <table>
                    <thead>
                        <tr>
                            <th>pseudo</th>
                            <th>mail</th>
                            <th>role</th>
                            <th class="btn-delete"></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </section>
        </article>



    </section>

</body>
</html>