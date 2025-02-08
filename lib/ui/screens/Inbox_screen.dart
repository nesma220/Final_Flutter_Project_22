import 'package:final_project/ui/widget/massage_bubble.dart';
import 'package:final_project/view_models/inbox_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxScreen extends StatelessWidget {
  final TextEditingController chatController = TextEditingController();
  final inboxController = Get.put(InboxController());

  InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                print("obx");
                var chats = inboxController.chats;
                return ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    final message = chats.value[index];
                    print('message: $message');
                    return MassageBubble(
                      message: message,
                    );
                  },
                );
              },
            ),
          ),
          TextField(
            controller: chatController,
            decoration: InputDecoration(
              hintText: 'Write a message...',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              ),
              suffix: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  inboxController.addAMessage(chatController.text);
                  chatController.clear();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
