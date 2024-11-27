

import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'param.g.dart';
// part 'param.freezed.dart';
@riverpod
class LoginParam {
  bool? isSuccess = false;
  String? message;

  LoginParam({this.isSuccess, this.message});
  @override 
  build(bool isSuccess){
    return isSuccess;

  } 
}
