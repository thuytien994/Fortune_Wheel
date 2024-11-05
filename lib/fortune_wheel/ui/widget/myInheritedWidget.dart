import 'package:flutter/material.dart';

class UI extends ChangeNotifier {
  bool? isLoading = false;
  Widget? child;
  bool? isSuccess;
  String? message;
}
