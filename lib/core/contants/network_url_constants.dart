class NetworkUrlConstants {
  const NetworkUrlConstants._();

  static const String baseURL = "https://be.k2pos.vn/api/";
  static const String baseURLDev = "https://be-dev.k2pos.vn/api/";
  static const String baseURLStag = "https://be-staging.k2pos.vn/api/";
  //lucky spin
  static const String urlSign =
      "${baseURL}customer/create-customer-lucky-wheel";
  static const String urlgetVoucher =
      "${baseURL}KenBarVoucher/get-kenbar-vouchers";
  static const String urlGetGiftReceived = "${baseURL}Gifts/get-gifts";
  static const String urlGetGiftFormBarcode = '${baseURL}Order/create-gift';
  static const String urlGetActiveLuckySpins =
      '${baseURL}luckySpin/active-lucky-spins';
  static const String urlGetGiftForSpin =
      '${baseURL}luckySpin/lucky-spin-gifts'; // Lấy quà khi nhập thông tin quay thưởng cho khách hàng
}
