import { RouteLocationRaw } from "vue-router";

import { createNewEntry, updateExistingEntry } from "./formRequestHandler";
import { useFormStore } from "@/stores/registrationFormStore";
import { Ref } from "vue";

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
    return null;
  }

  routeLocation.query = updatedData;
  return routeLocation;
};

export const submitCreateForm = async (
  accessToken: string,
  requestErrorRef: Ref<string>
) => {
  const formStore = getInitializedPinia();
  const createdData = await createNewEntry(accessToken, formStore);

  if (createdData === null) {
    requestErrorRef.value = "作成に失敗しました";
    return null;
  }

  routeLocation.query = createdData;
  return routeLocation;
};
