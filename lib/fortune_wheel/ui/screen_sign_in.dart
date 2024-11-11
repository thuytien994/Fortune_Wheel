import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenSignIn extends StatelessWidget {
  final TextEditingController controllerName;
  final TextEditingController controllerPhone;
  final bool isLogging;
  final Function(String name, String phone) onSignIn;
  const ScreenSignIn({
    super.key,
    required this.onSignIn,
    required this.controllerName,
    required this.controllerPhone,
    this.isLogging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 8, 143, 253), width: 2),
            color: Colors.black.withOpacity(0.7),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Tham dự',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.amber,
                    fontWeight: FontWeight.w700,
                    fontSize: 28),
              ),
              const Text(
                'Vui lòng nhập thông tin để quay thưởng',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              _inputInfo(
                context: context,
                labelText: 'Nhập tên',
                controller: controllerName,
                textInput: TextInputType.name,
                onValidator: (value) {
                  if (value == null || value.isEmpty == true) {
                    return "Vui lòng nhập họ và tên";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              _inputInfo(
                context: context,
                labelText: 'Nhập số điện thoại',
                controller: controllerPhone,
                textInput: TextInputType.phone,
                onValidator: (value) => validatePhone(value ?? ''),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 140,
                height: 48,
                child: ElevatedButton(
                  onPressed: isLogging
                      ? null
                      : () {
                          FocusScope.of(context).unfocus();
                          onSignIn(controllerName.text, controllerPhone.text);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                  child: const Text('Bắt đầu'),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  String? validatePhone(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Vui lòng nhập số điện thoạt';
    }
    if (!regExp.hasMatch(value)) {
      return 'Số điện thoạt chưa đúng';
    }
    if (value.length < 10) {
      return 'Số điện thoạt chưa đúng';
    }
    return null;
  }

  Widget _inputInfo({
    required BuildContext context,
    required String labelText,
    required TextEditingController controller,
    required TextInputType textInput,
    required Function(String? value) onValidator,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: TextFormField(
        validator: (value) => onValidator(value),
        textAlign: TextAlign.justify,
        keyboardType: textInput,
        controller: controller,
        inputFormatters: inputFormatters,
        style: const TextStyle(color: Colors.white),
        scrollPadding: const EdgeInsets.symmetric(vertical: 0),
        decoration: InputDecoration(
          isDense: true,
          hintText: labelText,
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: Colors.white),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
              borderRadius: BorderRadius.circular(5.0)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
              borderRadius: BorderRadius.circular(5.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.amber, width: 2.0),
              borderRadius: BorderRadius.circular(5.0)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
