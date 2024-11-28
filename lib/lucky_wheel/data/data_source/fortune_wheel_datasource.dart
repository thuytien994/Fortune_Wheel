import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/gateway/remote/base_api_response.dart';
import 'package:flutter_application_1/core/gateway/remote/base_result.dart';
import 'package:flutter_application_1/fortune_wheel_1/data/model/account_model.dart';
import 'package:flutter_application_1/fortune_wheel_1/data/model/signin_request.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_received_model.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/voucher_model.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_model.dart';

final dio = Dio();

class LuckyWheelDataSource {
  static const urlSign =
      'https://be.vinkingtea.com/api/customer/create-customer-lucky-wheel';
  final urlgetVoucher =
      'https://be.vinkingtea.com/api/KenBarVoucher/get-kenbar-vouchers';
  final urlGetGiftReceived = 'https://be.vinkingtea.com/api/Gifts/get-gifts';

  LuckyWheelDataSource() {
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  Future<GiftModel2> singInLuckyWheel(String phone) async {
    final response = await dio.post(urlSign, data: {"phoneNumber": phone});
    GiftModel2 data = GiftModel2.fromJson(response.data['data']);
    return data;
  }

  Future<List<GiftModel>> getGifts() async {
    try {
      var response = await dio.get(urlgetVoucher);
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
      print('aaaa 1 ${response}');
      if (response.statusCode == 200) {
        print('aaaa datasource: $response');
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
}
