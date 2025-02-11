import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  const ChatScreen({super.key, required this.chatId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String currentUserId = ""; 
  late ChatUser currentUser;
  late ChatUser otherUser;
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
      });
      await loadUsers(); // انتظر تحميل بيانات المستخدمين قبل تحديث الواجهة
    }
  }

  Future<void> loadUsers() async {
    try {
      DocumentSnapshot chatDoc = await FirebaseFirestore.instance.collection('chatRooms').doc(widget.chatId).get();
      List users = chatDoc['users'];

      String otherUserId = users.firstWhere((id) => id != currentUserId);

      DocumentSnapshot currentUserDoc = await FirebaseFirestore.instance.collection('users').doc(currentUserId).get();
      DocumentSnapshot otherUserDoc = await FirebaseFirestore.instance.collection('users').doc(otherUserId).get();

      setState(() {
        currentUser = ChatUser(
          id: currentUserId,
          firstName: currentUserDoc['firstName'],
        );

        otherUser = ChatUser(
          id: otherUserId,
          firstName: otherUserDoc['firstName'],
        );

        isLoading = false;
      });
    } catch (e) {
      print("خطأ في تحميل المستخدمين: $e");
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
      appBar: AppBar(title: Text("الدردشة")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chatRooms')
                  .doc(widget.chatId)
                  .collection('messages')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

                List<ChatMessage> messages = snapshot.data!.docs.map((doc) {
                  return ChatMessage(
                    text: doc['text'],
                    user: doc['userId'] == currentUser.id ? currentUser : otherUser,
                    createdAt: doc['createdAt'].toDate(),
                  );
                }).toList();

                return DashChat(
                  currentUser: currentUser,
                  messages: messages,
              onSend: (message) {
  sendMessageWithNotification(widget.chatId, currentUser.id, message.text, currentUser.firstName!, otherUser.id);
},

                );
              },
            ),
    );
  }
}
