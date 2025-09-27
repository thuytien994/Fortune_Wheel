import 'package:flutter_application_1/core/gateway/remote/remote/base_repository.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_received_model.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_model.dart';

import '../data_source/fortune_wheel_datasource.dart';

class LuckyWheelRepository extends BaseRepository {
  final LuckyWheelDataSource dataSource = LuckyWheelDataSource();

  LuckyWheelRepository();

  Future<List<GiftModel>> getGifts(int shopId) async {
    return await getResponseData(
      () async {
        final data = await dataSource.getGifts(shopId);
        print("here giftssss: ${data.length}");
        return data;
      },
    );
  }

  Future<GiftReceivedModel> signInLuckyWheel(String phone, int shopId) async {
    return await getResponseData(
      () async {
        final data = await dataSource.singInLuckyWheel(phone, shopId);
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

  Future<GiftReceivedModel?> getGiftsFormBarcode(
      String barcode, int shopId) async {
    return await getResponseData(
      () async {
        final data = await dataSource.getGiftsFormBarcode(barcode, shopId);
        return data;
      },
    );
  }
}
