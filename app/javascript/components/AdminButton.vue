<template>
  <div class="text-center">
    <v-btn
      color="green"
      dark
      @click="getImages()"
    >データ取得</v-btn>
  </div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  name: 'AdminButton',
  methods: {
    ...mapActions([
      'getImages'
    ])
  }
}
</script>