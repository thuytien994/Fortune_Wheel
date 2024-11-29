import 'package:flutter_application_1/core/gateway/remote/remote/base_repository.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_received_model.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_model.dart';

import '../data_source/fortune_wheel_datasource.dart';

class LuckyWheelRepository extends BaseRepository {
  final LuckyWheelDataSource dataSource = LuckyWheelDataSource();

  LuckyWheelRepository();

  @override
  Future<List<GiftModel>> getGifts() async {
    return await getResponseData(
      () async {
        final data = await dataSource.getGifts();
        return data;
      },
    );
  }

  Future<GiftReceivedModel> signInLuckyWheel(String phone) async {
    return await getResponseData(
      () async {
        final data = await dataSource.singInLuckyWheel(phone);
        return data;
      },
    );
  }

  Future<List<GiftReceivedModel>> getGiftReceived() async {
    return await getResponseData(
      () async {
        final data = await dataSource.getGiftReceived();
        return data;
      },
    );
  }
}
