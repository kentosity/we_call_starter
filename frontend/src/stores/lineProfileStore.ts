import { defineStore } from "pinia";

export interface LineProfile {
  userId: string;
  displayName: string;
  pictureUrl: string;
  statusMessage: string;
}

const defaultLineProfile: LineProfile = {
  userId: "",
  displayName: "",
  pictureUrl: "",
  statusMessage: "",
};

export const useFormStore = defineStore<string, LineProfile>("lineProfile", {
  state: () => defaultLineProfile,
});
