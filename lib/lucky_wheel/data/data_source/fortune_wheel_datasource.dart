import 'package:dio/dio.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_received_model.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_model.dart';

final dio = Dio();

class LuckyWheelDataSource {
  static const urlSign =
      'https://be.k2pos.vn/api/customer/create-customer-lucky-wheel';
  final urlgetVoucher =
      'https://be.k2pos.vn/api/KenBarVoucher/get-kenbar-vouchers';
  final urlGetGiftReceived = 'https://be.k2pos.vn/api/Gifts/get-gifts';

  final urlGetGiftFormBarcode = 'https://be.k2pos.vn/api/Order/create-gift';
  LuckyWheelDataSource() {
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  Future<GiftReceivedModel> singInLuckyWheel(String phone) async {
    final response = await dio.post(urlSign, data: {"phoneNumber": phone});
    GiftReceivedModel data = GiftReceivedModel.fromJson(response.data['data']);
    return data;
  }

  Future<List<GiftModel>> getGifts(int shopId) async {
    try {
      var response = await dio.get("$urlgetVoucher/$shopId");
      if (response.statusCode == 200) {
        Map<String, dynamic> userMap = response.data;
        return (userMap['data'] as List<dynamic>)
            .map((item) => GiftModel.fromJson(item))
            .toList();
      }
    } catch (e) {
      print('Error: $e');
    }
    return [];
  }

  Future<List<GiftReceivedModel>> getGiftReceived() async {
    try {
      var response = await dio.get(urlGetGiftReceived);
      if (response.statusCode == 200) {
        Map<String, dynamic> userMap = response.data;
        return (userMap['data'] as List<dynamic>)
            .map((item) => GiftReceivedModel.fromJson(item))
            .toList();
      }
    } catch (e) {
      print('Error: $e');
    }
    return [];
  }

  Future<GiftReceivedModel?> getGiftsFormBarcode(
      String barcode, int shopId) async {
    try {
      var response = await dio.get('$urlGetGiftFormBarcode/$barcode/$shopId');
      return GiftReceivedModel.fromJson(response.data['data']);
    } catch (e) {
      print('catch: $e');
    }
    return null;
  }
}
