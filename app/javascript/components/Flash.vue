<template>
  <transition name="flash">
    <v-alert
      v-if="flash"
      :type="flash.type"
      width="100%"
      dismissible
      transition="scale-transition"
      class="flash-message__position flash"
    >
      {{ flash.message }}
    </v-alert>
  </transition>
</template>

<script>
  import { mapGetters } from 'vuex';

  export default {
    name: 'Flash',
    computed: {
      ...mapGetters([
        'flash'
      ]),
    },
  }
</script>

<style>
.flash-message__position {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 100;
}
.flash-enter-active, .flash-leave-active {
  transition: opacity 0.5s;
}
.flash-enter, .flash-leave-to {
  opacity: 0;
}
</style>