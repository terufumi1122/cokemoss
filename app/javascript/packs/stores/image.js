import axios from "axios";

export default {
  state: {
    images: []
  },

  getters: {
    images(state) {
      return state.images;
    }
  },

  mutations: {
    images(state) {
      state.images = payload.images;
    }
  },

  actions: {
    setimages(context) {
      axios
        .get("/api/v1/images")
        .then(response => {
          context.commit("images", { images: response.data });
        })
        .catch(error => {
          console.error(error);
        });
    }
  }
};
