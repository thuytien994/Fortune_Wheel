import 'package:freezed_annotation/freezed_annotation.dart';

part 'lucky_wheel_model.freezed.dart';
part 'lucky_wheel_model.g.dart';

@freezed
class LuckyWheelModel with _$LuckyWheelModel {
  const LuckyWheelModel._();
  const factory LuckyWheelModel({
    required String id,
    @Default('') String spinName,
    DateTime? startDate,
    DateTime? endDate,
    int? maxParticipants,
    required int shopId,
    String? backgroundImage,
    String? color1,
    String? color2,
    String? status,
    String? spinButtonImage,
    DateTime? createdDate,
    DateTime? updateDate,
    @Default("ByInputInvoide") String? gameType,
    @Default([]) List<LuckyWheelPriceModel> luckyPrizeModel,
  }) = _LuckyWheelModel;

  factory LuckyWheelModel.fromJson(Map<String, dynamic> json) =>
      _$LuckyWheelModelFromJson(json);
  bool byInvoiceBarcode() {
    if (gameType != "ByInvoiceBarcode") return false;
    return true;
  }

  bool byInputNumberPhone() {
    if (gameType != "ByInputNumberPhone") return false;
    return true;
  }

  bool byLink() {
    if (gameType != "ByLink") return false;
    return true;
  }

  bool byInputInvoideCode() {
    if (gameType != "ByInputInvoice") return false;
    return true;
  }
}

@freezed
class LuckyWheelPriceModel with _$LuckyWheelPriceModel {
  const factory LuckyWheelPriceModel({
    required String id,
    required String spinId,
    String? prizeName,
    int? prizeQuantity,
    double? prizeProbability,
    int? prizeOrder,
    String? prizeImage,
  }) = _LuckyWheelPriceModel;

  factory LuckyWheelPriceModel.fromJson(Map<String, dynamic> json) =>
      _$LuckyWheelPriceModelFromJson(json);
}
