import Vue from 'vue/dist/vue.esm'
// import IllustPreview from '../illust_preview.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#illust_preview',
    data() {
        return {
            url: ""
        }
    },
    methods: {
      uploadFile() {
        const file = this.$refs.preview.files[0];
        console.log(file)
        this.url = URL.createObjectURL(file)
      }
    },
  })
})