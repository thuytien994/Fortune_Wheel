import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/lucky_wheel_new/view_model/lucky_wheel_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabScreenSignIn extends StatelessWidget {
  final TextEditingController controllerPhone;
  TabScreenSignIn({
    super.key,
    required this.controllerPhone,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.4,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 8, 143, 253), width: 2),
          color: Colors.black.withOpacity(0.7),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Tham dự',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.amber,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Vui lòng nhập thông tin để quay thưởng',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                // _inputInfo(
                //   context: context,
                //   labelText: 'Nhập tên',
                //   controller: controllerName,
                //   textInput: TextInputType.name,
                //   onValidator: (value) {
                //     if (value == null || value.isEmpty == true) {
                //       return "Vui lòng nhập họ và tên";
                //     }
                //     return null;
                //   },
                // ),
                const SizedBox(
                  height: 10,
                ),
                _inputInfo(
                  context: context,
                  labelText: 'Số điện thoại',
                  controller: controllerPhone,
                  textInput: TextInputType.phone,
                  onValidator: (value) => validatePhone(value ?? ''),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer(
                  builder: (context, ref, child) => SizedBox(
                    width: 170,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await ref
                              .read(luckyWheelViewModelProvider.notifier)
                              .signInLuckyWheel(
                                controllerPhone.text,
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white,
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      ),
                      child: const Text(
                        'Bắt đầu',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
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
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: TextFormField(
        validator: (value) => onValidator(value),
        textAlign: TextAlign.justify,
        keyboardType: textInput,
        controller: controller,
        inputFormatters: inputFormatters,
        style: const TextStyle(color: Colors.white, fontSize: 20),
        scrollPadding: const EdgeInsets.symmetric(vertical: 10),
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
