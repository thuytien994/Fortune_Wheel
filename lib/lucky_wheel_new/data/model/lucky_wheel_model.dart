import 'package:freezed_annotation/freezed_annotation.dart';

part 'lucky_wheel_model.freezed.dart';
part 'lucky_wheel_model.g.dart';

@freezed
class LuckyWheelModel with _$LuckyWheelModel {
  const LuckyWheelModel._();
  const factory LuckyWheelModel({
    @JsonKey(name: 'id') @Default("") String id,
    @JsonKey(name: 'spinName') @Default("") String spinName,
    @JsonKey(name: 'startDate') @Default(null) DateTime? startDate,
    @JsonKey(name: 'endDate') @Default(null) DateTime? endDate,
    @JsonKey(name: 'maxSpinPerDay') @Default(null) int? maxSpinPerDay,
    @JsonKey(name: 'shopId') @Default(0) int shopId,
    @JsonKey(name: 'backgroundImage') @Default("") String backgroundImage,
    @JsonKey(name: 'backgroundImageMobile')
    @Default("")
    String backgroundImageMobile,
    @JsonKey(name: 'color1') @Default("") String color1,
    @JsonKey(name: 'status') @Default("") String status,
    @JsonKey(name: 'color2') @Default("") String color2,
    @JsonKey(name: 'createdDate') DateTime? createdDate,
    @JsonKey(name: 'spinButtonImage') @Default("") String spinButtonImage,
    @JsonKey(name: 'gameType') @Default("ByInputInvoide") String gameType,
    @JsonKey(name: 'platform') @Default("") String platform,
    @JsonKey(name: 'logoImage') @Default("") String logoImage,
    @Default([]) List<LuckyPrizeDataModel> luckyPrizeModel,
  }) = _LuckyWheelModel;

  factory LuckyWheelModel.fromJson(Map<String, dynamic> json) =>
      _$LuckyWheelModelFromJson(json);
  // bool byInvoiceBarcode() {
  //   if (gameType != "ByInvoiceBarcode") return false;
  //   return true;
  // }

  bool byInputNumberPhone() {
    if (gameType.toLowerCase() != "ByInputNumberPhone".toLowerCase()) {
      return false;
    }

    return true;
  }

  bool byLink() {
    if (gameType.toLowerCase() != "ByLink".toLowerCase()) return false;
    return true;
  }

  bool byInputInvoideCode() {
    if (gameType.toLowerCase() != "ByInputInvoice".toLowerCase()) return false;
    return true;
  }

  bool byInputQR() {
    if (gameType.toLowerCase() != "ByInputQR".toLowerCase()) return false;
    return true;
  }
}

@freezed
class LuckyPrizeDataModel with _$LuckyPrizeDataModel {
  const LuckyPrizeDataModel._();

  const factory LuckyPrizeDataModel({
    //  @JsonKey(name: 'spinId') String? spinId,
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'prizeName') @Default("") String prizeName,
    @JsonKey(name: 'prizeQuantity') @Default(0) int prizeQuantity,
    @JsonKey(name: 'prizeProbability') @Default(0) double prizeProbability,
    @JsonKey(name: 'prizeColor') @Default("") String prizeColor,
    @JsonKey(name: 'prizeImage') @Default("") String prizeImage,
    @JsonKey(name: 'prizeOrder') @Default(0) int prizeOrder,
    @JsonKey(name: 'totalAmount') @Default(0) double totalAmount,
  }) = _LuckyPrizeDataModel;

  factory LuckyPrizeDataModel.fromJson(Map<String, dynamic> json) =>
      _$LuckyPrizeDataModelFromJson(json);
}
