import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/account_model.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/voucher_model.dart';
import 'dart:convert';

import '../model/signin_request.dart';

final dio = Dio();

class SpinData {
  static const urlSign =
      'https://be.vinkingtea.com/api/customer/create-customer-lucky-wheel';
  var urlgetVoucher =
      'https://be.vinkingtea.com/api/KenBarVoucher/get-kenbar-vouchers';

  SpinData() {
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  Future<AccountModel?> login(SigninRequest request) async {
    try {
      var response = await dio.post(urlSign, data: request.toJson());

      if (response.statusCode == 200) {
        return AccountModel.fromJson(
            response.data['data'] as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<List<VoucherModel>> getVoucher() async {
    try {
      var response = await dio.get(urlgetVoucher);
      if (response.statusCode == 200) {
        Map<String, dynamic> userMap = response.data;
        return (userMap['data'] as List<dynamic>)
            .map((item) => VoucherModel.fromJson(item))
            .toList();
      }
    } catch (e) {
      print('Error: $e');
    }
    return [];
  }
}
