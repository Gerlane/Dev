<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'

interface Post {
  title: string,
  body: string,
}
export default defineComponent({
  data() {
    return {
      posts: [],
      title: String,
      body: String,
    }
  },
  methods: {
    async loadPosts() {
      const response = await api.get("/posts")
      this.posts = response.data as Post[]
    },
    clearForm() {
      this.title = ""
      this.body = ""
    },
    async createPost(){
      await api.post("/posts", {title: this.title, body: this.body})
      this.clearForm()
      await this.loadPosts()
    },
  },
  async mounted() {
    this.clearForm()
    await this.loadPosts()
  }
})
</script>

<template>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
  <div class="container">
    <h1>Novo Post</h1>
    <form class="form">
      <div class="form-group">
        <label for="title">Título:</label>
        <input id="title" v-model="title" class="form-control"/>
      </div>
      <div class="form-group">
        <label for="body">Comentário:</label>
        <textarea id="body" v-model="body" class="form-control" maxlength="280"></textarea>
      </div>
      <button @click="createPost" class=" btn">Postar</button>
    </form>

    <h1>Posts</h1>
    <div v-for="post in posts" class="post">
      <div>
        <h3>{{ post.title }}</h3>
        <div>{{ post.body }}</div>
        <div class="actions">
          <button class="btn-action"><i class="far fa-heart"></i></button>
          <button class="btn-action"><i class="far fa-comment"></i></button>
          <button class="btn-action"><i class="fas fa-retweet"></i></button>
        </div>
      </div> 
    </div>
  </div>
</template>

<style scoped>
body {
  background-color: #15202b;
}

body {
  background-color: #15202b;
  color: white;
  font-family: 'Helvetica Neue', sans-serif;
}
.form {
  display: flex;
  flex-direction: column;
  margin-bottom: 2rem;
}

.form-group {
  display: flex;
  flex-direction: column;
  margin-bottom: 1rem;
}

.form-control {
  padding: 0.5rem;
  font-size: 1rem;
  background-color: #192734;
  border: none;
  color: white;
}

.btn {
  padding: 0.3rem 11rem; /* Reduz o preenchimento */
  font-size: 0.8rem; /* Reduz o tamanho da fonte */
  background-color: #1da1f2;
  color: white;
  border: none;
  cursor: pointer;
}

.post {
  border: 1px solid #38444d;
  padding: 1rem;
  margin-bottom: 1rem;
  background-color: #192734;
}
.actions {
  display: flex;
  justify-content: space-around;
  margin-top: 1rem;
}
.btn-action {
  background: none;
  border: none;
  color: #657786; /* Altera a cor para cinza claro */
  font-size: 1.2rem;
  cursor: pointer;
}
</style>
