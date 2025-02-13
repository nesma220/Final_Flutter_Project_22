import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  String currentUserId = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUserId = user.uid;
        isLoading = false;
      });
    } else {
      print("لم يتم العثور على المستخدم الحالي.");
      setState(() {
        isLoading = false;
      });
    }
  }


  void sendMessageWithNotification(String chatId, String userId, String text, String senderName, String receiverId) async {
  // حفظ الرسالة في Firestore
  FirebaseFirestore.instance.collection('chatRooms').doc(chatId).collection('messages').add({
    'text': text,
    'userId': userId,
    'senderName': senderName,
    'createdAt': FieldValue.serverTimestamp(),
  });

  // تحديث آخر رسالة في المحادثة
  FirebaseFirestore.instance.collection('chatRooms').doc(chatId).update({
    'lastMessage': text,
    'lastMessageTime': FieldValue.serverTimestamp(),
  });

  // جلب FCM Token للمستخدم المستلم
  DocumentSnapshot receiverDoc = await FirebaseFirestore.instance.collection('users').doc(receiverId).get();
  String? receiverToken = receiverDoc['fcmToken'];

  if (receiverToken != null) {
    // إرسال الإشعار عبر Firebase Cloud Messaging
    FirebaseMessaging.instance.sendMessage(
      to: receiverToken,
      data: {'title': senderName, 'body': text},
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("المحادثات")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : currentUserId.isEmpty
              ? Center(child: Text("لم يتم تسجيل الدخول"))
              : StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('chatRooms')
                      .where('users', arrayContains: currentUserId)
                      .orderBy('lastMessageTime', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

                    var chatRooms = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: chatRooms.length,
                      itemBuilder: (context, index) {
                        var chatData = chatRooms[index];
                        var chatId = chatData.id;
                        var lastMessage = chatData['lastMessage'] ?? "لا توجد رسائل بعد";
                        var otherUserId = (chatData['users'] as List).firstWhere((id) => id != currentUserId);

                        return FutureBuilder<DocumentSnapshot>(
                          future: FirebaseFirestore.instance.collection('users').doc(otherUserId).get(),
                          builder: (context, userSnapshot) {
                            if (!userSnapshot.hasData) return ListTile(title: Text("جارٍ التحميل..."));

                            var otherUserName = userSnapshot.data!['firstName'] ?? "مستخدم مجهول";

                            return ListTile(
                              title: Text("محادثة مع $otherUserName"),
                              subtitle: Text(lastMessage),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatScreen(chatId: chatId),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
    );
  }
}
