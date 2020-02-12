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
          if (error instanceof HttpError && error.response.status == 429) {
            console.error(error);
            context.dispatch('createFlash', {type: 'error', message: 'APIリクエスト回数制限に達しました。1時間以上後に再度試して下さい'})
          } else {
            console.error(error);
            context.dispatch('createFlash', {type: 'error', message: 'データの取得に失敗しました'})
          }
        });
    }
  }
};
