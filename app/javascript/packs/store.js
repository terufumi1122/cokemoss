import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import pinStore from './stores/pin.js'
import pageStore from './stores/page.js'
import flashStore from './stores/flash.js'
import userStore from './stores/user.js'

const store = new Vuex.Store({
  strict: process.env.NODE_ENV !== 'production',

  modules: {
    pinStore,
    pageStore,
    flashStore,
    userStore,
  },

})

export default store