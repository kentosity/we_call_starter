import { defineStore } from "pinia";

export interface RegistrationFormState {
  surname: string;
  name: string;
  surnameKana: string;
  nameKana: string;
  gender: string;
  year: number;
  month: number;
  date: number;
  prefecture: string;
  address: string;
  email: string;
}

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
