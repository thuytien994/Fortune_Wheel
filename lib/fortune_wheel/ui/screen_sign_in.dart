import 'package:flutter/material.dart';

class ScreenSignIn extends StatefulWidget {
  final TextEditingController controllerName;
  final TextEditingController controllerPhone;
  final Function(String name, String phone) onSignIn;
  const ScreenSignIn({
    super.key,
    required this.onSignIn,
    required this.controllerName,
    required this.controllerPhone,
  });

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
            ),
            const SizedBox(
              height: 10,
            ),
            _inputInfo(
                context: context,
                labelText: 'Nhập số điện thoại',
                controller: widget.controllerPhone,
                textInput: TextInputType.phone),
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
                  child: Text('Đăng nhập')),
            ),
            const SizedBox(
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
            style: const TextStyle(color: Colors.white),
            scrollPadding: EdgeInsets.zero,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
