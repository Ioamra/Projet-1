<?php
    session_start();
    empty($_SESSION['id']) && header("location:connexion.php");
    require_once 'includes/bdd.php';
    require_once 'includes/functions/format-date-diff.php';
    require_once 'includes/functions/limit-content.php';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Page d'acceuil</title>
    <meta name="description" content="Page d'acceuil du forum">
    <?php require_once 'includes/head.php'; ?>
    <link rel="stylesheet" href="assets/css/home.css">
</head>
<body>
<?php
    require_once 'includes/nav.php';
    require_once 'includes/btn-return-top.php';
    
    $nb_topics_by_page = 20;
    $page = isset($_GET['page']) ? $_GET['page'] : 1;
    $offset = ($page - 1) * $nb_topics_by_page;
    $req = $bdd->prepare("SELECT id_topic, title_topic, message_topic, date_topic, pseudo_user FROM topic INNER JOIN user ON topic.id_user = user.id_user LIMIT $nb_topics_by_page OFFSET $offset");
    $req->execute();
    $list_topic = $req->fetchAll();
?>

    <section class="card-container">
    <?php
        foreach ($list_topic as $li) {
    ?>
        <article class="topic">
            <a href="view-topic.php?id=<?=$li['id_topic']?>">
                <h3 class="topic-title"><?=limitContent($li['title_topic'], 100)?></h3>
                <section class="topic-content"><?=limitContent($li['message_topic'], 200)?></section>
                <section class="topic-author-and-date">
                    <i>de <?=$li['pseudo_user']?></i>
                    <i><?=formatDateDiff($li['date_topic'])?></i>
                </section>
            </a>
        </article>
    <?php
        }
    ?>
    </section>
</body>
</html>