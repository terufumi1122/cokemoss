<template>
  <div class="text-center">
    <v-card>
      <v-container>
        <v-row>
          <v-col>
            <v-img
              :height="pin.height"
              :width="pin.width"
              :src="pin.image_url"
              :href="pin.pin_url"
            ></v-img>
          </v-col>
        </v-row>
      </v-container>
    </v-card>
  </div>
</template>

<script>
export default {
  name: 'PinCard',
  props: {
    pin: {},
  }
}
</script>