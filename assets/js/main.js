function toggleNavLinks() {
    let navLinks = document.querySelector('.nav-links');
    navLinks.classList.contains('show') ? navLinks.classList.remove('show') : navLinks.classList.add('show');
}