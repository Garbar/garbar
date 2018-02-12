<template>
  <div class="jumbotron">
    <p class="lead">{{ message }}</p>
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