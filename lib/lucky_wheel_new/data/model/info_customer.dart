import 'package:json_annotation/json_annotation.dart';

part 'info_customer.g.dart';

@JsonSerializable()
class InfoCustomer {
  String? spinId;
  int? shopId;
  String? userName;
  String? phoneNumber;
  String? invoiceCode;
  String? barcode;
  InfoCustomer(
      {this.barcode,
      this.invoiceCode,
      this.phoneNumber,
      this.shopId,
      this.spinId,
      this.userName});
  factory InfoCustomer.fromJson(Map<String, dynamic> json) =>
      _$InfoCustomerFromJson(json);

  /// Connect the generated [_$InfoCustomerToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$InfoCustomerToJson(this);
}
