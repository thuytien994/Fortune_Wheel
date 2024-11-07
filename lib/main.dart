import 'package:flutter/material.dart';
import 'js_interop.dart'; // Nhập file interop Dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  String _storedValue = "";

  @override
  void initState() {
    super.initState();
    _loadStoredValue();
  }

  // Gọi hàm JavaScript để lưu dữ liệu vào localStorage
  _saveToLocalStorage() {
    saveToLocalStorage('myVariable', _controller.text); // Gọi JavaScript
    _loadStoredValue(); // Tải lại giá trị từ localStorage
  }

  // Gọi hàm JavaScript để lấy dữ liệu từ localStorage
  _loadStoredValue() {
    setState(() {
      _storedValue = getFromLocalStorage('myVariable') ??
          "Chưa có dữ liệu"; // Gọi JavaScript
    });
  }

  // Gọi hàm JavaScript để xóa dữ liệu khỏi localStorage
  _clearStoredValue() {
    removeFromLocalStorage('myVariable'); // Gọi JavaScript
    _loadStoredValue(); // Tải lại giá trị từ localStorage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Web LocalStorage Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Nhập giá trị'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveToLocalStorage,
              child: Text('Lưu Dữ Liệu'),
            ),
            SizedBox(height: 20),
            Text('Giá trị đã lưu: $_storedValue'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearStoredValue,
              child: Text('Xóa Dữ Liệu'),
            ),
          ],
        ),
      ),
    );
  }
}
