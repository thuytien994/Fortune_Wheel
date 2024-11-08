import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenSignIn extends StatefulWidget {
  final TextEditingController controllerName;
  final TextEditingController controllerPhone;
  final Function(String name, String phone) onSignIn;
  final GlobalKey<FormState> formKeyName;
  final GlobalKey<FormState> formKeyPhone;
  const ScreenSignIn(
      {super.key,
      required this.onSignIn,
      required this.controllerName,
      required this.controllerPhone,
      required this.formKeyPhone,
      required this.formKeyName});

  @override
  State<ScreenSignIn> createState() => _ScreenSignInState();
}

class _ScreenSignInState extends State<ScreenSignIn> {
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
                'Đăng nhập',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.amber),
              ),
              const SizedBox(
                height: 30,
              ),
              _inputInfo(
                context: context,
                labelText: 'Nhập tên',
                controller: widget.controllerName,
                textInput: TextInputType.name,
                formKey: widget.formKeyName,
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
                controller: widget.controllerPhone,
                textInput: TextInputType.phone,
                formKey: widget.formKeyPhone,
                onValidator: (value) => validatePhone(value ?? ''),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      widget.onSignIn(widget.controllerName.text,
                          widget.controllerPhone.text);
                    },
                    child: const Text('Đăng nhập')),
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
    RegExp regExp = new RegExp(pattern);
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
    required GlobalKey<FormState> formKey,
    required Function(String? value) onValidator,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 76,
          child: Form(
            key: formKey,
            child: TextFormField(
              validator: (value) => onValidator(value),
              textAlign: TextAlign.justify,
              keyboardType: textInput,
              controller: controller,
              inputFormatters: inputFormatters,
              style: const TextStyle(color: Colors.white),
              scrollPadding: EdgeInsets.symmetric(vertical: 0),
              decoration: InputDecoration(
                isDense: true,
                hintText: '${labelText}',
                fillColor: Colors.white,
                hintStyle: const TextStyle(color: Colors.white),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.amber, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          )),
    );
  }
}
