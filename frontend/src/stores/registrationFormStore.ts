import { RegistrationFormState } from "@/types";
import { defineStore } from "pinia";

const defaultFormValue: RegistrationFormState = {
  surname: "",
  name: "",
  surnameKana: "",
  nameKana: "",
  gender: "",
  year: 2000,
  month: 1,
  date: 1,
  prefecture: "",
  address: "",
  email: "",
};

export const useFormStore = defineStore<string, RegistrationFormState>(
  "registrationForm",
  {
    state: () => defaultFormValue,
  }
);
