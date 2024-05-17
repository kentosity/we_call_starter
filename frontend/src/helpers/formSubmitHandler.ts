import { RouteLocationRaw, useRouter } from "vue-router";

import { createNewEntry, updateExistingEntry } from "./formRequestHandler";
import { useFormStore } from "@/stores/registrationFormStore";
import { Ref } from "vue";

const router = useRouter();

// piniaのinitializeを待つ必要があるので、globalで呼べない
const getInitializedPinia = () => useFormStore();

let routeLocation: RouteLocationRaw = {
  path: "/result",
  query: undefined,
};

export const submitUpdateForm = async (
  accessToken: string,
  requestErrorRef: Ref<string>
) => {
  const formStore = getInitializedPinia();
  const updatedData = await updateExistingEntry(accessToken, formStore);

  if (updatedData === null) {
    requestErrorRef.value = "アップデートに失敗しました。";
    return;
  }

  routeLocation.query = updatedData;
  router.push(routeLocation);
};

export const submitCreateForm = async (
  accessToken: string,
  requestErrorRef: Ref<string>
) => {
  const formStore = getInitializedPinia();
  const createdData = await createNewEntry(accessToken, formStore);
  if (createdData === null) {
    requestErrorRef.value = "作成に失敗しました";
    return;
  }

  routeLocation.query = createdData;
  router.push(routeLocation);
};
