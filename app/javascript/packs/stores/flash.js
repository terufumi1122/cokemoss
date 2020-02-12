export default {
  state: {
    flash: null
  },

  getters: {
    flash(state) {
      return state.flash;
    }
  },

  mutations: {
    deleteFlash(state) {
      state.flash = null;
    },
    createFlash(state, payload) {
      state.flash = {
        type: payload.type,
        message: payload.message
      };
    }
  },
  actions: {
    createFlash(context, flashParams) {
      context.commit("createFlash", {
        type: flashParams.type,
        message: flashParams.message
      });
      setTimeout(() => {
        context.commit("deleteFlash");
      }, 2000);
    }
  }
};
