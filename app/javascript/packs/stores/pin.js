import axios from "axios";

export default {
  state: {
    pins: []
  },

  getters: {
    pins(state) {
      return state.pins;
    }
  },

  mutations: {
    pins(state, payload) {
      state.pins = payload.pins;
    }
  },

  actions: {
    getPins(context) {
      axios
        .get("/api/v1/pins")
        .then(response => {
          context.commit('pins', { pins: response.pins })
          context.commit('page', { page: response.page })
          context.dispatch('createFlash', {type: 'success', message: 'データの取得に成功しました'})
        })
        .catch(error => {
          console.error(error)
          context.dispatch('createFlash', {type: 'error', message: 'データの取得に失敗しました'})
        });
    }
  }
};
