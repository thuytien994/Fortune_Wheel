class NetworkUrlConstants {
  const NetworkUrlConstants._();

  static const String baseURL = "https://be.k2pos.vn/api/";
  static const String baseURLDev = "https://be-dev.k2pos.vn/api/";
  static const String baseURLStag = "https://be-staging.k2pos.vn/api/";
  //lucky spin
  static const String urlSign =
      "${baseURLStag}customer/create-customer-lucky-wheel";
  static const String urlgetVoucher =
      "${baseURLStag}KenBarVoucher/get-kenbar-vouchers";
  static const String urlGetGiftReceived = "${baseURLStag}Gifts/get-gifts";
  static const String urlGetGiftFormBarcode = '${baseURLStag}Order/create-gift';
}
