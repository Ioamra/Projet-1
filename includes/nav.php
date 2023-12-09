<nav id="navbar" class="navbar">
    <section class="nav-header">
        <div class="nav-logo">
            <a href="index.php">
                <img src="assets/img/logo.png" alt="logo">
            </a>
        </div>
        <h2 class="nav-title">Natter</h2>  
        <div class="icon-menu-dropdown">
            <img src="assets/svg/menu.svg" alt="menu" onclick="toggleNavLinks()">
        </div>
    </section>
    <ul class="nav-links">
    <?php
        if (empty($_SESSION['id'])) {
            echo '<li><a href="connexion.php" title="connexion">Connexion</a></li>';
            echo '<li><a href="inscription.php" title="inscription">Inscription</a></li>';
        } else {
            echo '<li><a href="index.php" title="acceuil">Accueil</a></li>';
            echo '<li><a href="creer-un-topic.php" title="créer un topic">Créer un topic</a></li>';
            if ($_SESSION['role'] == 1) {
                echo '<li><a href="admin.php" title="administration">Admin</a></li>';
            }
            echo '<li><a href="deconnexion.php" title="déconnexion">Déconnexion</a></li>';
        }
    ?>
    </ul>
</nav>

<div id="top"></div>