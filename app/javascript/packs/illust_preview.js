import Vue from 'vue/dist/vue.esm'

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