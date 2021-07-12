import IllustEdit from '../IllustEdit.vue'
import Vue from 'vue'
import VueKonva from 'vue-konva'
Vue.use(VueKonva)


document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#canvas-konva',
    render: h => h(IllustEdit)
  })

  console.log(app)
})