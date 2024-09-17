import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chat App'),
        actions: [
          IconButton(
            onPressed: (){
              FirebaseAuth.instance.signOut();
            },
             icon: const Icon(Icons.exit_to_app),
             color:const Color.fromARGB(255, 108, 99, 255),
             )
        ],
      ),
      body: const Column(
        children: [
          Expanded(
            child: ChatMessages()
            
            ),
          NewMessage(),
        ],
      )
    );
  }
}