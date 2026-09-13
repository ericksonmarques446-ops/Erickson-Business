function toggleMenu() {

    const nav = document.querySelector(".nav");

    if (nav.style.display === "flex") {
        nav.style.display = "none";
    } else {
        nav.style.display = "flex";
        nav.style.flexDirection = "column";
        nav.style.position = "absolute";
        nav.style.top = "80px";
        nav.style.left = "0";
        nav.style.width = "100%";
        nav.style.padding = "25px";
        nav.style.background = "#0A0A0A";
    }
}