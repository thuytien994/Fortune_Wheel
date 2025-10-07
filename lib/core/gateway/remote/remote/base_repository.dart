import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:k2pos_spin/core/gateway/remote/remote/base_api_exception.dart';
import 'package:k2pos_spin/core/gateway/remote/remote/base_response.dart';
import 'package:k2pos_spin/core/gateway/remote/remote/custom_exception.dart';

class BaseRepository {
  Future<dynamic> getResponseData(Future<dynamic> Function() action) async {
    try {
      return await action();
    } on SocketException catch (_) {
      throw CustomException("Vui lòng kiểm tra kết nối internet!");
    } on DioException catch (e) {
      if (e.response != null) {
        final errorResponse = BaseResponse.fromJson(e.response?.data);
        throw CustomException(errorResponse.message ?? "");
      }
      throw CustomException(e.message ?? "");
    } on BaseApiException catch (_) {
      rethrow;
    } catch (e) {
      log("Error: $e");
      throw CustomException("Đã có lỗi xảy ra, vui lòng thử lại!");
    }
  }
}
