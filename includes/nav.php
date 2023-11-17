<nav id="navbar" class="navbar">
    <section class="nav-header">
        <section class="nav-logo">
            <a href="./">
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
        if(empty($_SESSION['id'])) {
    ?>
        <li><a href="connexion" title="connexion">Connexion</a></li>
        <li><a href="inscription" title="inscription">Inscription</a></li>
    <?php
        } else {
    ?>
        <li><a href="logout" title="déconexion">Déconexion</a></li>
    <?php
        }
    ?>
    </ul>
</nav>

<div id="top"></div>