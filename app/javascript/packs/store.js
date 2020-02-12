import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import pinStore from './stores/pin.js'
import userStore from './stores/user.js'

const store = new Vuex.Store({
  strict: process.env.NODE_ENV !== 'production',

  modules: {
    pinStore,
    userStore,
  },

})

export default store