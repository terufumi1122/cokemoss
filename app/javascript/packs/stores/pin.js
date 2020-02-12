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
          context.commit("pins", { pins: response.data });
        })
        .catch(error => {
          console.error(error);
        });
    }
  }
};
