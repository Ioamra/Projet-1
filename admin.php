<?php
    session_start();
    empty($_SESSION['role']) && header("location:connexion.php");
    $_SESSION['role'] != 1 && header("location:index.php");
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Natter - Administration</title>
    <?php require_once 'includes/head.php'; ?>
    <link rel="stylesheet" href="assets/css/admin.css">
    <script src="assets/js/admin.js"></script>
</head>
<body onload="getUsers(); getTopics(); getComments();">
    <?php
    require_once 'includes/bdd.php';
    require_once 'includes/nav.php';
    require_once 'includes/btn-return-top.php';
    ?>
    <main>
        <div class="card-container">
            <article>
                <h2>
                    <button id="dropdown-btn-user" class="dropdown-btn" onclick="showAndHideDropdown('user')">
                        <img src="assets/svg/arrow-down.svg" alt="Flèche indiquant la possibilité d'afficher du contenu.">
                            Utilisateur
                        <img src="assets/svg/arrow-down.svg" alt="Flèche indiquant la possibilité d'afficher du contenu.">
                    </button>
                </h2>
                <div id="dropdown-content-user" class="dropdown-content">
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
                    <div id="paging-user" class="paging"></div>
                </div>
            </article>
            <article>
                <h2>
                    <button id="dropdown-btn-topic" class="dropdown-btn" onclick="showAndHideDropdown('topic')">
                        <img src="assets/svg/arrow-down.svg" alt="Flèche indiquant la possibilité d'afficher du contenu.">
                            Topic
                        <img src="assets/svg/arrow-down.svg" alt="Flèche indiquant la possibilité d'afficher du contenu.">
                    </button>
                </h2>
                <div id="dropdown-content-topic" class="dropdown-content">
                    <table>
                        <thead>
                            <tr>
                                <th>titre</th>
                                <th>message</th>
                                <th>date</th>
                                <th>pseudo de l'utilisateur</th>
                                <th class="btn-delete"></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <div id="paging-topic" class="paging"></div>
                </div>
            </article>
            <article>
                <h2>
                    <button id="dropdown-btn-comment" class="dropdown-btn" onclick="showAndHideDropdown('comment')">
                        <img src="assets/svg/arrow-down.svg" alt="Flèche indiquant la possibilité d'afficher du contenu.">
                            Commentaire
                        <img src="assets/svg/arrow-down.svg" alt="Flèche indiquant la possibilité d'afficher du contenu.">
                    </button>
                </h2>
                <div id="dropdown-content-comment" class="dropdown-content">
                    <table>
                        <thead>
                            <tr>
                                <th>commentaire</th>
                                <th>date</th>
                                <th>titre du topic</th>
                                <th>pseudo de l'utilisateur</th>
                                <th class="btn-delete"></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <div id="paging-comment" class="paging"></div>
                </div>
            </article>
        </div>
    </main>

    <?php require_once "includes/footer.php" ?>
</body>
</html>