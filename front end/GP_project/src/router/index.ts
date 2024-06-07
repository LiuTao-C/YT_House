import { createRouter, createWebHistory } from 'vue-router'
import AppLayout from "@/components/Layout/AppLayout.vue"
import IndexView from "@/views/IndexView.vue"
import { useTokenStore } from '@/stores/mytoken'
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path:'/login',
      name: 'login',
      component: ()=>import('@/views/login/LoginView.vue'),
      
    },
    {
      path: '/',
      name: 'home',
      component: AppLayout,
      meta:{requiresAuth: true},
      children:[
        {
          path: '',
          name: '',
          component: IndexView
        },
        {
          path: '/about',
          name: 'about',
          // route level code-splitting
          // this generates a separate chunk (about.[hash].js) for this route
          // which is lazy-loaded when the route is visited.懒加载，
          component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
        },{
          path:'/:xxx(.*)*',
          name:"ErrorPage",
          component:() => import ('../views/Errorpage.vue')
        },{
          path:'/newaudit',
          name:'newaudit',
          component:()=>import('@/views/audit/NewAudit.vue')
        },{
          path:'/auditlistview',
          name:'auditlistview',
          component:()=>import('@/views/audit/AuditListView.vue')
        },{
          path:'/checklistview/:id/check',
          name:'checklistview',
          component:()=>import('@/views/audit/CheckListView.vue')
        },{
          path:'/actlistview',
          name:'actlistview',
          component:()=>import('@/views/action/actListView.vue')
        },{
          path:'/newactview',
          name:'newactview',
          component:()=>import('@/views/action/newActView.vue')
        },{
          path:'/checkactview/:id/check',
          name:'checkactview',
          component:()=>import('@/views/action/checkActView.vue')
        },{
          path:'/newreportview',
          name:'newreportview',
          component:()=>import('@/views/report/NewReportView.vue')
        },{
          path:'/reportlistview',
          name:'reportlistview',
          component:()=>import('@/views/report/ReportListView.vue')
        },{
          path:'/checkreportview/:id/check',
          name:'checkreportview',
          component:()=>import('@/views/report/CheckReportView.vue')
        },{
          path:'/newhazard',
          name:'newhazard',
          component:()=>import('@/views/hazard/NewHazard.vue')
        },{
          path:'/hazardlistview',
          name:'hazardlistview',
          component:()=>import('@/views/hazard/HazardListView.vue')
        },{
          path:'/checkhazardview/:id/check',
          name:'checkhazardview',
          component:()=>import('@/views/hazard/CheckHazard.vue')
        },{
          path:'/newsupporter',
          name:'newsupporter',
          component:()=>import('@/views/support/NewSupporter.vue')
        },{
          path:'/supportlist',
          name:'supportlist',
          component:()=> import ('@/views/support/SupportListView.vue')
        },{
          path:'documentlist',
          name:'documentlist',
          component:()=> import ('@/views/document/DocumentListView.vue')
        }
      ]
    },

  ]
})
//访问每个页面前回调
router.beforeEach((to,from,next) => {
  if (to.matched.some((r)=>r.meta?.requiresAuth)){
    const store = useTokenStore()
    if(!store.token) {
      next({name: "login" ,query:{redirect: to.fullPath}})
      return 
    }
  }
  //往后走的代码
  next()
  
})

export default router
