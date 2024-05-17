import liff from "@line/liff";

const LIFF_ID = import.meta.env.VITE_LIFF_ID;

export const authorizeWithLine = async () => {
  await liff.init({
    liffId: LIFF_ID,
    withLoginOnExternalBrowser: true,
  });

  const isLoggedIn = liff.isLoggedIn();

  if (!isLoggedIn) {
    liff.login();
  }
};

export const retrieveAccessToken = (): string => {
  const accessToken = liff.getAccessToken();
  if (accessToken === null) liff.login();

  // liffのinitializeが先なのでaccessTokenがないことはない
  return accessToken!;
};
