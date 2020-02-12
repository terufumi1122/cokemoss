<template>
  <v-app id="app">
    <Flash></Flash>
    <Header></Header>
    <Top></Top>
  </v-app>
</template>

<script>
import Flash from "./components/Flash"
import Header from "./components/Header"
import Top from "./components/Top"

export default {
  components: {
    Flash,
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
