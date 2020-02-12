<template>
  <section id="top">
    <h1>Welcome to cokemoss!!</h1>
    <AdminButton></AdminButton>
  </section>
</template>

<script>
import AdminButton from './AdminButton'
  export default {
    name: 'Top',
    components: {
      AdminButton,
    }
  }
</script>

<style>
  h1 {
    text-align: center;
  }
</style>