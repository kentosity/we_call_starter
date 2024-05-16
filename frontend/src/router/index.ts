import { createWebHistory, createRouter } from "vue-router";

import Home from "../views/Home.vue";
import Result from "../views/Result.vue";

const routes = [
  { path: "/", component: Home },
  { path: "/result", component: Result },
];

export const router = createRouter({
  history: createWebHistory(),
  routes,
});
