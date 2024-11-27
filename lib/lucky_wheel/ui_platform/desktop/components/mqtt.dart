import 'dart:convert';

import 'package:flutter_application_1/fortune_wheel_1/data/model/voucher_model.dart';
import 'package:flutter_application_1/lucky_wheel/view_model/lucky_wheel_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:universal_html/html.dart';

class MQTTManager {
  late MqttBrowserClient client;

  Future<void> connect() async {
    // Tạo client MQTT và cấu hình kết nối qua WebSocket
    client =
        MqttBrowserClient("wss://broker.hivemq.com/mqtt", "clientId-flenRjSuFm")
          ..port = 8884 // Cổng WebSocket (ví dụ cho EMQX hoặc Mosquitto)
          ..logging(on: true);

    // Cấu hình kết nối (có thể sử dụng username, password nếu cần)
    final connectMessage = MqttConnectMessage()
        .withClientIdentifier("clientId-flenRjSuFm")
        .startClean();

    client.connectionMessage = connectMessage;

    try {
      print('MQTT: Đang kết nối...');
      await client.connect();
    } catch (e) {
      print('MQTT: Lỗi kết nối - $e');
      client.disconnect();
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('MQTT: Kết nối thành công!');
    } else {
      print('MQTT: Kết nối thất bại - ${client.connectionStatus}');
      client.disconnect();
    }
  }

  // Đăng ký vào một chủ đề
  Future<void> subscribe(String topic) async {
    // Kiểm tra xem client đã kết nối chưa
    if (client?.connectionStatus?.state != MqttConnectionState.connected) {
      print('Không thể đăng ký vì client chưa kết nối!');
      return;
    }

    // Đăng ký vào chủ đề với mức độ QoS là atLeastOnce
    client?.subscribe(topic, MqttQos.atLeastOnce);
    print("Đã đăng ký vào chủ đề: $topic");

    // Lắng nghe các tin nhắn từ chủ đề đã đăng ký

    await client?.updates
        ?.listen((List<MqttReceivedMessage<MqttMessage?>>? messages) {
      print('messages: $messages');
      if (messages != null && messages.isNotEmpty) {
        for (var message in messages) {
          final recMess = message.payload as MqttPublishMessage;
          final messageContent =
              MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
          print('Nhận tin nhắn từ $topic: $messageContent');
          Map<String, dynamic> valueMap = jsonDecode(messageContent);
          GiftModel2 gift = GiftModel2.fromJson(valueMap);
          print('hahahahah: ${gift.code}');
          final container = ProviderContainer();
          container
              .read(luckyWheelViewModelProvider.notifier)
              .signInLuckyWheel222(gift);

          //window.location.reload();
          // window.location.reload();
          return;
        }
      }
    });
  }
}
