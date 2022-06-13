<template>
  <div v-if="!didLoad">
    <h1>Loading...</h1>
  </div>

  <div v-if="didLoad" class="post-list">
    <!-- eslint-disable -->
    <div v-for="post in posts" :key="posts.id" class="post">
      <small>{{ post.date }}</small>
      <h2>{{ post.title }}</h2>
      <p>{{ post.content }}</p>

      <div class="post-reactions">
        <button @click="insertMotivationalMessage()">Enviar frase motivacional</button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "PostsList",
  data() {
    return {
      posts: [],
      didLoad: false,
    };
  },
  mounted() {
    axios.get(`http://localhost:8080/post/all`).then((res) => {
      this.loadPosts(res.data);
    });
  },

  methods: {
    loadPosts(data) {
      if (data.length >= 3) {
        for (let i = 0; i < 3; i++) {
          this.posts.push(data[i]);
        }
        this.didLoad = true;
      } else {
        this.posts = data;
        this.didLoad = true;
      }
    },

    insertMotivationalMessage() {
      var m = window.prompt("Mensagem: ");
      console.log(m)
    },
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,400;1,100&display=swap");

.post-list {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
}

.post {
  background: linear-gradient(to bottom right, rgb(0, 30, 128), rgb(40, 0, 81));
  width: 33%;
  aspect-ratio: 1/1;

  color: white;
  padding: 1em;
  border-radius: 10px;
  margin: 15px;
  font-family: "Poppins";
}

.post > :is(small) {
  color: rgb(214, 214, 214);
  font-weight: 300;
}

.post > :is(p) {
  font-weight: 300;
}

.post-reactions > button {
  font-family: "Poppins";
  background: none;
  color: #fff;
  padding: 0.5em 1.5em;
  border: 1px solid white;
  border-radius: 15px;
}

.post-reactions > button:hover {
  background: #fff;
  color: rgb(0, 30, 128);
  cursor: pointer;
  transition: 0.3s ease-in-out;
}
</style>