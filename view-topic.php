<?php
    session_start();
    empty($_GET['id']) || empty($_SESSION['id']) && header("location:index.php");
    require_once 'includes/bdd.php';
    require_once 'includes/functions/format-date-diff.php';
    require_once 'includes/functions/limit-content.php';
    
    $req = $bdd->prepare("SELECT title_topic, message_topic, date_topic, pseudo_user FROM topic INNER JOIN user ON topic.id_user = user.id_user WHERE id_topic = ".$_GET['id']);
    $req->execute();
    $topic = $req->fetch(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title><?=limitContent($topic['title_topic'], 40)?></title>
    <meta name="description" content="<?=limitContent($topic['message_topic'], 160)?>">
    <?php require_once 'includes/head.php'; ?>
    <link rel="stylesheet" href="assets/css/view-topic.css">
    <script src="assets/js/view-topic.js"></script>
</head>
<body onload="getComment(<?=$_GET['id']?>)">
    <?php
    require_once 'includes/nav.php';
    require_once 'includes/btn-return-top.php';
    ?>

    <main>
        <section class="card-container">
            <article class="topic">
                <h3 class="topic-title"><?=nl2br(strip_tags($topic['title_topic']))?></h3>
                <section class="topic-content"><?=nl2br(strip_tags($topic['message_topic']))?></section>
                <section class="topic-author-and-date">
                    <i>de <?=nl2br(strip_tags($topic['pseudo_user']))?></i>
                    <i><?=nl2br(strip_tags(formatDateDiff($topic['date_topic'])))?></i>
                </section>
            </article>
            <section class="add-comment">
                <textarea name="content-comment" id="content-comment" rows="10" placeholder="Ajouter un commentaire"></textarea>
                <section class="container-btn-submit">
                    <button name="submit-comment" onclick="addComment(<?=$_GET['id']?>, <?=$_SESSION['id']?>)">Ajouter un commentaire</button>
                </section>
            </section>
            <section id="comment-container"></section>
        </section>
    </main>
    <?php require_once "includes/footer.php" ?>
</body>
</html>