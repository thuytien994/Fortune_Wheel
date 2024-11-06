import 'package:flutter/material.dart';

class ScreenSignIn extends StatefulWidget {
  final Function(String name, String phone) onSignIn;
  const ScreenSignIn({super.key, required this.onSignIn});

  @override
  State<ScreenSignIn> createState() => _ScreenSignInState();
}

class _ScreenSignInState extends State<ScreenSignIn> {
  final controllerName = TextEditingController();
  final controllerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: MediaQuery.sizeOf(context).height * 0.3,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 8, 143, 253), width: 2),
            color: Colors.black.withOpacity(0.7),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
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
              controller: controllerName,
              textInput: TextInputType.name,
            ),
            const SizedBox(
              height: 10,
            ),
            _inputInfo(
                context: context,
                labelText: 'Nhập số điện thoại',
                controller: controllerPhone,
                textInput: TextInputType.phone),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        widget.onSignIn(
                            controllerName.text, controllerPhone.text);
                      },
                      child: Text('Đăng nhập')),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget _inputInfo({
    required BuildContext context,
    required String labelText,
    required TextEditingController controller,
    required TextInputType textInput,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 40,
        child: TextField(
            textAlign: TextAlign.justify,
            keyboardType: textInput,
            controller: controller,
            style: TextStyle(color: Colors.white),
            scrollPadding: EdgeInsets.zero,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              hintText: '${labelText}',
              fillColor: Colors.white,
              hintStyle: const TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.amber, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0)),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
            )),
      ),
    );
  }
}
