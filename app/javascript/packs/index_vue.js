/* eslint no-console: 0 */

import Vue from 'vue/dist/vue.esm'
import App from '../components/app.vue'
import Element from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import locale from 'element-ui/lib/locale/lang/en'

Vue.use(Element, { locale })

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    components: { App },
    template: '<App/>'
  })
  console.log(app)
})