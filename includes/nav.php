<nav id="navbar" class="navbar">
    <section class="nav-header">
        <section class="nav-logo">
            <a href="index">
                <img src="assets/img/logo.jpg" alt="logo">
            </a>
        </section>
        <h1 class="nav-title">Nom du site</h1>  
        <section class="icon-menu-dropdown">
            <img src="assets/svg/menu.svg" alt="menu" onclick="toggleNavLinks()">
        </section>
    </section>
    <ul class="nav-links">
    <?php
        if (empty($_SESSION['id'])) {
            echo '<li><a href="connexion" title="connexion">Connexion</a></li>';
            echo '<li><a href="inscription" title="inscription">Inscription</a></li>';
        } else {
            echo '<li><a href="index" title="acceuil">Acceuil</a></li>';
            echo '<li><a href="creer-un-topic" title="créer un topic">Créer un topic</a></li>';
            if ($_SESSION['role'] == 1) {
                echo '<li><a href="admin" title="administration">Admin</a></li>';
            }
            echo '<li><a href="deconnexion" title="déconexion">Déconexion</a></li>';
        }
    ?>
    </ul>
</nav>

<div id="top"></div>