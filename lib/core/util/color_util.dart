import 'package:flutter/material.dart';

class ColorUtil {
  const ColorUtil._();

  static Color hexToColor(String hex) {
    // Bỏ dấu # nếu có
    final cleanedHex = hex.replaceAll("#", "");
    // Chuyển đổi thành Color
    return Color(
      int.parse("FF$cleanedHex", radix: 16),
    );
  }

  static String colorToHex(Color color) {
    return color.value.toRadixString(16).padLeft(8, '0');
  }
}
