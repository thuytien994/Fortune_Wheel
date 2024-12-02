import 'dart:convert';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_received_model.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart';

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

  Future<void> publishMessage(GiftReceivedModel gift) async {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    String jsonGift = jsonEncode(gift.toJson());
    builder.addString(jsonGift);
    print('haha${jsonEncode(gift.toJson())} ');
    Map<String, dynamic> valueMap = jsonDecode(jsonEncode(gift.toJson()));
    GiftReceivedModel giftt = GiftReceivedModel.fromJson(valueMap);
    print('oke ${giftt.gift}');
    client.publishMessage(
        "KENBAR/${gift.shopId}", // Topic
        MqttQos.atMostOnce, // QoS level
        builder.payload! // Payload
        );
    print('Message sent: $gift');
  }

  // Đăng ký vào một chủ đề
  Future<void> subscribe(String topic,
      {required Function(Map<String, dynamic> data) callback}) async {
    // Kiểm tra xem client đã kết nối chưa
    if (client?.connectionStatus?.state != MqttConnectionState.connected) {
      print('hear Không thể đăng ký vì client chưa kết nối!');
      return;
    }

    // Đăng ký vào chủ đề với mức độ QoS là atLeastOnce
    client.subscribe(topic, MqttQos.atLeastOnce);
    print("hear Đã đăng ký vào chủ đề: $topic");

    // Lắng nghe các tin nhắn từ chủ đề đã đăng ký

    await client.updates
        ?.listen((List<MqttReceivedMessage<MqttMessage?>>? messages) {
      if (messages != null && messages.isNotEmpty) {
        for (var message in messages) {
          final recMess = message.payload as MqttPublishMessage;
          final messageContent =
              MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
          print('here Nhận tin nhắn từ $topic: $messageContent');

          Map<String, dynamic> valueMap = jsonDecode(messageContent);
          callback(valueMap);
          return;
        }
      }
    });
  }
}
