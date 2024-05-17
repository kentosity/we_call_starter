import { RegistrationFormState } from "@/types";

const divider = "-";

export const convertBirthday2Number = (data: string) => {
  // birthdayがない、誤っている場合は考えない
  const [year, month, date] = data.split(divider);
  return {
    year: +year,
    month: +month,
    date: +date,
  };
};

export const convertNumber2Birthday = (data: RegistrationFormState) =>
  [data.year, data.month, data.date].join(divider);
