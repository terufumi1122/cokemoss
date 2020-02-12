<template>
  <v-app id="app">
    <Header></Header>
    <Top></Top>
  </v-app>
</template>

<script>
import Header from "./components/Header"
import Top from "./components/Top"

export default {
  components: {
    Header,
    Top,
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
