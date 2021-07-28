<template>
  <div id="IllustCanvas">
    <v-stage :config="configKonva">
      <v-layer>
        <v-image :config="configImage"></v-image>
      </v-layer>
    </v-stage>
  </div>
</template>

<script>
// import 'pin.png'

const canvasWidth = 1200;
const canvasHeight = 800;

export default {
  props: {
    file: {
      type: String,
      default: null
    },
    user: {
      type: Number,
      default: null
    }
  },
  data() {
    return {
      configKonva: {
        width: canvasWidth, 
        height: canvasHeight,
      },
      image: null,
    };
  },
  created() {
    const image = new Image(900,700);
    image.src = require(`../../public/users/${this.user}/${this.file}`)
    image.onload = () => {
      this.image = image
    };
  },
  computed: {
    configImage: function() {
      return {
        x: 150,
        y: 50,
        image: this.image,
        draggable: true
      }
    }
  },
};
</script> 