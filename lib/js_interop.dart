@JS()
import 'package:js/js.dart';

@JS()
external void saveToLocalStorage(String key, String value);

@JS()
external String getFromLocalStorage(String key);

@JS()
external void removeFromLocalStorage(String key);

@JS()
external void clearLocalStorage();
