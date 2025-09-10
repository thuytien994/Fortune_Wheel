import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/contants/network_url_constants.dart';
import 'package:flutter_application_1/lucky_wheel_new/data/model/gift_received_model.dart';
import 'package:flutter_application_1/lucky_wheel_new/data/model/gift_model.dart';
import 'package:flutter_application_1/lucky_wheel_new/data/model/lucky_wheel_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dio = Dio();

class LuckyWheelDataSource {
  LuckyWheelDataSource() {
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: true,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }));
  }

  Future<GiftReceivedModel> singInLuckyWheel(String phone, int shopId) async {
    final response = await dio.post(NetworkUrlConstants.urlSign, data: {
      "phoneNumber": phone,
      "shopId": shopId,
    });
    GiftReceivedModel data = GiftReceivedModel.fromJson(response.data['data']);
    return data;
  }

  Future<List<GiftModel>> getGifts(int shopId) async {
    try {
      var response =
          await dio.get("${NetworkUrlConstants.urlgetVoucher}/$shopId");
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
      var response = await dio.get(NetworkUrlConstants.urlGetGiftReceived);
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
      var response = await dio
          .get('${NetworkUrlConstants.urlGetGiftFormBarcode}/$barcode/$shopId');
      return GiftReceivedModel.fromJson(response.data['data']);
    } catch (e) {
      print('catch: $e');
    }
    return null;
  }

  Future<LuckyWheelModel?> getActiveLuckySpins(int shopId) async {
    try {
      var response = await dio
          .get('${NetworkUrlConstants.urlGetActiveLuckySpins}/$shopId');
      return LuckyWheelModel.fromJson(response.data['data']);
    } catch (e) {
      print('catch: $e');
    }
    return null;
  }
}
