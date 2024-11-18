import 'package:flutter_application_1/fortune_wheel/data/data_source/fortune_wheel_datasource.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/signin_request.dart';
import 'package:flutter_application_1/fortune_wheel/repository/fortune_wheel_repository.dart';

class FortuneWheelRepositoryImpl extends FortuneWheelRepository {
  var dataSource = FortuneWheelDatasource();
  @override
  Future <bool>signIn(SigninRequest request) async {
    try {
    await  dataSource.login(request);
    return true;
    } catch (e) {
      print(Exception(e));
    }
    return false;
  }
}
