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

// export const getLineProfile = async () => {
//   const profile = await liff.getProfile();
//   return profile;
// };

export const getAccessToken = () => {
  const accessToken = liff.getAccessToken();
  return accessToken;
};
