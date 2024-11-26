import 'package:flutter_application_1/core/gateway/remote/remote/base_repository.dart';
import 'package:flutter_application_1/fortune_wheel_1/data/model/voucher_model.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_model.dart';

import '../data_source/fortune_wheel_datasource.dart';

class LuckyWheelRepository extends BaseRepository {
  final LuckyWheelDataSource dataSource = LuckyWheelDataSource();

  LuckyWheelRepository();

  @override
  Future<List<GiftModel2>> getGifts() async {
    return await getResponseData(
      () async {
        final data = await dataSource.getGifts();
        print('hear $data');
        return data;
      },
    );
  }


  Future<GiftModel2> signInLuckyWheel(String phone) async {
    return await getResponseData(
      () async {
        final data = await dataSource.singInLuckyWheel(phone);
        return data;
      },
    );
  }
}
