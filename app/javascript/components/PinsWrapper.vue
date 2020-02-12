<template>
  <v-container>
    <div v-for="pin in pins" :key="pin.id">
      <v-row>
        <v-col>
          <PinCard
            :pin="pin"
          ></PinCard>
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex'
import PinCard from './PinCard'

  export default {
    name: 'PinsWrapper',
    components: {
      PinCard,
    },
    computed: {
      ...mapGetters([
        'pins',
      ])
    }

  }
</script>