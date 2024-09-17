import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authUser = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No message Found'),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong...'),
          );
        }

        final loadedMessage = snapshot.data!.docs;
        return ListView.builder(
          padding: const EdgeInsets.only(left: 13, bottom: 40, right: 13),
          reverse: true,
          itemCount: loadedMessage.length,
          itemBuilder: (ctx, index) {
            // Cast to Map<String, dynamic> for proper access
            final chatMessage = loadedMessage[index].data();
            final nextMessage = index + 1 < loadedMessage.length
                ? loadedMessage[index + 1].data() as Map<String, dynamic>?
                : null;

            final currentMessageUserID = chatMessage['userID'] as String;
            final nextMessageUserID =
                nextMessage != null ? nextMessage['userID'] as String : null;
            final bool nextUserIsSame = nextMessageUserID == currentMessageUserID;

            if (nextUserIsSame) {
              return MessageBubble.next(
                message: chatMessage['text'] as String,
                isMe: authUser.uid == currentMessageUserID,
              );
            } else {
              return MessageBubble.first(
                userImage: chatMessage['userImage'] as String,
                username: chatMessage['userName'] as String,
                message: chatMessage['text'] as String,
                isMe: authUser.uid == currentMessageUserID,
              );
            }
          },
        );
      },
    );
  }
}

