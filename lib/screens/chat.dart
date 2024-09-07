import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Chat'),
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
      body: const Center(
        child: Text('Logged In'),
      ),
    );
  }
}