<template>
      <div class="jumbotron">
        <h1>ひだまり荘</h1>
        <p class="lead">{{ message }}</p>
        <button class="btn btn-outline-primary" type="submit">入る</button>
      </div>
</template>

<script>
export default {
  data() {
    return {
      message: 'Hello Vue'
    };
  }
};
</script>

<style scoped>
  #app {
    padding-top: 5.0rem;
  }
</style>