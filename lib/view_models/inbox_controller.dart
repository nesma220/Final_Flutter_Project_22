import 'package:get/get.dart';

class InboxController extends GetxController {
  RxList<ChatModel> chats = <ChatModel>[].obs;

  void addAMessage(String message) {
    print('add');
    chats.add(
      ChatModel(
        message: message,
        time: DateTime.now(),
        isMe: true,
      ),
    );
    print(chats);
    chats.refresh();
  }
}

class ChatModel {
  final String message;
  final DateTime time;
  final bool isMe;

  ChatModel({
    required this.message,
    required this.time,
    required this.isMe,
  });
}
