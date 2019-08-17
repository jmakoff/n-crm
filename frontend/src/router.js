import VueRouter from 'vue-router'

const routes = [
	{ path: '/masters', component: () => import('./pages/masters/list.vue') },
	{	path: '/dashboard', component: () => import ('./pages/dashboard/index.vue')},
	{	path: '*', redirect: '/dashboard'}
]

export default new VueRouter({ mode: 'history', routes })