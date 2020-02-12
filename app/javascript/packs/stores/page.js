export default {
  state: {
    page: {},
  },

  getters: {
    page(state) {
      return state.page;
    }
  },

  mutations: {
    page(state, payload) {
      state.page = payload.page;
    }
  },

  actions: {
  }
};
