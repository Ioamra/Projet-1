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
    <title>Natter - Page d'acceuil</title>
    <meta name="description" content="Rejoignez Natter : un forum dynamique où les passionnés de technologie et d'innovation partagent idées, astuces et discussions sur les dernières tendances.">
    <?php require_once 'includes/head.php'; ?>
    <link rel="stylesheet" href="assets/css/home.css">
</head>
<body>
<?php
    require_once 'includes/nav.php';
    require_once 'includes/btn-return-top.php';
    
    $nb_topics_by_page = 10;
    $page = isset($_GET['page']) ? $_GET['page'] : 1;
    $offset = ($page - 1) * $nb_topics_by_page;
    $req = $bdd->prepare("SELECT COUNT(id_topic) FROM topic");
    $req->execute();
    $nb_page = ceil(($req->fetch()[0]) / $nb_topics_by_page);
    $req = $bdd->prepare("SELECT id_topic, title_topic, message_topic, date_topic, pseudo_user FROM topic INNER JOIN user ON topic.id_user = user.id_user ORDER BY id_topic DESC LIMIT $nb_topics_by_page OFFSET $offset");
    $req->execute();
    $list_topic = $req->fetchAll(PDO::FETCH_ASSOC);
?>

    <main>
        <section class="card-container">
        <?php
            foreach ($list_topic as $li) {
        ?>
            <article class="topic">
                <a href="view-topic.php?id=<?=$li['id_topic']?>">
                    <h3 class="topic-title"><?=nl2br(limitContent(strip_tags($li['title_topic']), 100))?></h3>
                    <section class="topic-content"><?=nl2br(limitContent(strip_tags($li['message_topic']), 200))?></section>
                    <section class="topic-author-and-date">
                        <i>de <?=$li['pseudo_user']?></i>
                        <i><?=formatDateDiff($li['date_topic'])?></i>
                    </section>
                </a>
            </article>
        <?php
            }
        ?>

            <section id="paging-user" class="paging">
                <?php
                for ($i=1; $i < $nb_page+1; $i++) { 
                    if ($i == $page) {
                        echo '<button class="page-active">'.$i.'</button>';
                    } else {
                        echo '<button onclick="window.location.href='."'".'index.php?page='.$i."'".'">'.$i.'</button>';
                    }
                }
                ?>
            </section>
        </section>
    </main>
    <?php require_once "includes/footer.php" ?>
</body>
</html>