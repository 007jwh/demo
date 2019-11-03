import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/views/Index.vue'
import Login from '@/views/Login.vue'
import Cart from '@/views/Cart.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
    },
    {
      path: '/Login',
      name: 'Login',
      component: Login
    },
    {
      path: '/Index',
      name: 'Index',
      component: Index
    },
    {
      path: '/Cart',
      name: 'Cart',
      component: Cart
    }
  ]
})
