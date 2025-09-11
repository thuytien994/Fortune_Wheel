import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyTextUtil {
  const CopyTextUtil._();

  static void onCopyText(String textCopy, BuildContext context) async {
    try {
      await Clipboard.setData(ClipboardData(text: textCopy));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Copied to Clipboard!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to copy to clipboard.')),
      );
    }
  }
}
