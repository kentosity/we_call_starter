import { createPinia } from "pinia";
import { createApp } from "vue";
import { router } from "@/router";

import App from "@/App.vue";
import "@/style.css";
import { authorizeWithLine } from "./helpers/lineAuthentication";

const app = createApp(App);

const initApplication = async () => {
  await authorizeWithLine();

  app.use(createPinia());
  app.use(router);
  app.mount("#app");
};

initApplication();