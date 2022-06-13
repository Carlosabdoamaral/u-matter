<template>
  <!-- <HelloWorld msg="Welcome to Your Vue.js App"/> -->
  <NavbarComponent/>
  <div class="body">
    <PostsList/>
  </div>
</template>

<script>
// import HelloWorld from './components/HelloWorld.vue'
import NavbarComponent from './components/Navbar.vue'
import PostsList from './components/Posts.vue'

export default {
  name: 'App',
  components: {
    // HelloWorld
    NavbarComponent,
    PostsList
  }
}
</script>

<style>
* {
  padding: 0;
  margin: 0;
  box-sizing: content-box;
}

.body {
  min-height: 100vh;
  background: #282828;
}
</style>
