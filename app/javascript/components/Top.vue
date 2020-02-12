<template>
  <section id="top">
    <h1>Welcome to cokemoss!!</h1>
    <!-- 後でログイン時のみAdminButtonを使用するように変更する -->
    <AdminButton></AdminButton>
    <PinsWrapper></PinsWrapper>
  </section>
</template>

<script>
import { mapActions } from 'vuex'

import AdminButton from './AdminButton'
import PinsWrapper from './PinsWrapper'

  export default {
    name: 'Top',
    components: {
      AdminButton,
      PinsWrapper,
    },
    methods: {
      ...mapActions([
        'setPins'
      ])
    },
    created() {
      this.setPins()
    }
  }
</script>

<style>
  h1 {
    text-align: center;
  }
</style>