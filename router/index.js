import Vue from "vue";
import VueRouter from "vue-router";
import Demo from "../views/Demo.vue";
import Landing from "../views/Landing.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Landing,
  },
  {
    path:"/demo",
    name:"demo",
    component:Demo
  },
];

const router = new VueRouter({
  routes,
});

export default router;
