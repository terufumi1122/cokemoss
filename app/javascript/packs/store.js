import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import imageStore from './stores/image.js'
import userStore from './stores/user.js'

const store = new Vuex.Store({
  strict: process.env.NODE_ENV !== 'production',

  modules: {
    imageStore,
    userStore,
  },

})

export default store