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
<body onload="getUsers(); getTopics(); getComments();">
    <?php
    require_once 'includes/bdd.php';
    require_once 'includes/nav.php';
    require_once 'includes/btn-return-top.php';
    ?>
    <main>
        <section class="card-container">
            <article>
                <button id="dropdown-btn-user" class="dropdown-btn" onclick="showAndHideDropdown('user')">
                    <img src="assets/svg/arrow-down.svg">
                    Utilisateur
                    <img src="assets/svg/arrow-down.svg">
                </button>
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
                    <section id="paging-user" class="paging"></section>
                </section>
            </article>
            <article>
                <button id="dropdown-btn-topic" class="dropdown-btn" onclick="showAndHideDropdown('topic')">
                    <img src="assets/svg/arrow-down.svg">
                    Topic
                    <img src="assets/svg/arrow-down.svg">
                </button>
                <section id="dropdown-content-topic" class="dropdown-content">
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
                    <section id="paging-topic" class="paging"></section>
                </section>
            </article>
            <article>
                <button id="dropdown-btn-comment" class="dropdown-btn" onclick="showAndHideDropdown('comment')">
                    <img src="assets/svg/arrow-down.svg">
                    Commentaire
                    <img src="assets/svg/arrow-down.svg">
                </button>
                <section id="dropdown-content-comment" class="dropdown-content">
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
                    <section id="paging-comment" class="paging"></section>
                </section>
            </article>
        </section>
    </main>

    <?php require_once "includes/footer.php" ?>
</body>
</html>