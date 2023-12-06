// Gestion navbar

function toggleNavLinks() {
    let navLinks = document.querySelector('.nav-links');
    navLinks.classList.contains('show') ? navLinks.classList.remove('show') : navLinks.classList.add('show');
}

// Gestion button de retour en haut

document.addEventListener("scroll", showAndHideBtnReturnTop);

function showAndHideBtnReturnTop() {
    let scrollTop = window.scrollY || document.documentElement.scrollTop;
    let btnReturnTop = document.querySelector('#btn-return-top');
    scrollTop > 0 ? btnReturnTop.classList.add('show') : btnReturnTop.classList.remove('show');
}

// Fonctions

function limitContent(text, len) {
    return text.length > len ? text.substring(0, len) + '...' : text;
}
