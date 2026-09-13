function toggleMenu() {
    const menu = document.querySelector(".menu");

    if (menu) {
        menu.classList.toggle("active");
    }
}

function getToken() {
    return localStorage.getItem("eb_token");
}

function logout() {
    localStorage.removeItem("eb_token");
    window.location.href = "index.html";
}