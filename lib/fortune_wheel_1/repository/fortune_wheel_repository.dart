import 'package:flutter_application_1/fortune_wheel_1/data/model/signin_request.dart';

abstract class FortuneWheelRepository {
  Future<bool> signIn(SigninRequest data);
}