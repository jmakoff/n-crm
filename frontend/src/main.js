import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router'
import Buefy from 'buefy'

import router from './router'
import axiosConfig from './axiosConfig'

axiosConfig()
Vue.use(Buefy)
Vue.use(VueRouter)

Vue.config.productionTip = false

new Vue({
	router,
  render: h => h(App),
}).$mount('#app')
