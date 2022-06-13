<template>
    <nav>
        <h1>uMatter</h1>
        <button class="dwl-btn">Baixar</button>
    </nav>
</template>

<script>
export default {
    name : "NavbarComponent",
}
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,400;1,100&display=swap");

* {
    font-family: 'Poppins';
    background: #282828;
}

nav {
    padding: 1em;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    box-shadow: 0px 5px 10px black;
    height: 50px;
    color: #fff;
}

.dwl-btn {
    border: 1px solid white;
    padding: 0.5em 2em;
    border-radius: 15px;
    color: #FFF;
}

.dwl-btn:hover {
    transition: 0.4s ease-in-out;
    background: linear-gradient(to bottom right, rgb(0, 30, 128), rgb(40, 0, 81));
    cursor: pointer;
}
</style>