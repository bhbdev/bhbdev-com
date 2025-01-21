document.addEventListener('DOMContentLoaded', function() {
    const navToggle = document.querySelector('.nav-toggle');
    const menu = document.querySelector('#menu');

    navToggle.addEventListener('click', function() {
        menu.classList.toggle('active');
    });
});