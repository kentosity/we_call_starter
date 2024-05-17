import axios from "axios";

import { FormEntry, RegistrationFormState } from "@/types";
import {
  convertBirthday2Number,
  convertNumber2Birthday,
} from "./birthdayConversion";

const BASE_URL = "/api/entries";

export const retrieveExistingEntry = async (
  accessToken: string
): Promise<RegistrationFormState | null> => {
  const endpoint = BASE_URL + "/existing";
  const config = { params: { access_token: accessToken } };

  try {
    const { data } = await axios.get<FormEntry>(endpoint, config);
    const birthday = convertBirthday2Number(data.birthday);
    // uidはクライアント側では利用しない
    const { uid, ...rest } = data;
    const response = {
      ...rest,
      ...birthday,
    };

    return response;
  } catch {
    return null;
  }
};

const createRequestBody = (
  accessToken: string,
  data: RegistrationFormState
) => ({
  access_token: accessToken,
  ...data,
  birthday: convertNumber2Birthday(data),
});

export const updateExistingEntry = async (
  accessToken: string,
  data: RegistrationFormState
): Promise<FormEntry | null> => {
  const endpoint = BASE_URL + "/existing";
  const requestBody = createRequestBody(accessToken, data);
  try {
    const { data } = await axios.put<FormEntry | any>(endpoint, requestBody);
    return data;
  } catch {
    return null;
  }
};

export const createNewEntry = async (
  accessToken: string,
  data: RegistrationFormState
) => {
  const endpoint = BASE_URL;
  const requestBody = createRequestBody(accessToken, data);
  try {
    const { data } = await axios.post<FormEntry | any>(endpoint, requestBody);
    return data;
  } catch {
    return null;
  }
};
