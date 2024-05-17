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

type FormWithoutNumbers = Omit<
  RegistrationFormState,
  "year" | "month" | "date"
>;

export interface FormEntry extends FormWithoutNumbers {
  uid: string;
  birthday: string;
  [key: string]: string; // Index signature allowing string keys
}

export interface RegistrationFormAction {
  updateData: (newData: RegistrationFormState) => void;
}