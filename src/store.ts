import { _GettersTree, defineStore } from "pinia";

export interface StateInterface {
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

interface StoreGetters extends _GettersTree<StateInterface> {
  stringed: (state: StateInterface) => string;
}

interface StoreActions {
  submit: () => void;
}

export const useStore = defineStore<
  string,
  StateInterface,
  StoreGetters,
  StoreActions
>("main", {
  state: () => ({
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
  }),
  actions: {
    submit() {},
  },
  getters: {
    stringed: () => "",
  },
});
