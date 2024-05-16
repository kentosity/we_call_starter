import { RegistrationFormState } from "@/types";

const divider = "-";

export const convertBirthday2Number = (data: string) => {
  const [year, month, date] = data.split(divider);
  return {
    year,
    month,
    date,
  };
};

export const convertNumber2Birthday = (data: RegistrationFormState) =>
  [data.year, data.month, data.date].join(divider);
