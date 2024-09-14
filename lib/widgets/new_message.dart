import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {

  final messageController=TextEditingController();

@override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  sendMessage(){

   final enteredMessage = messageController.text;

    if(enteredMessage.trim().isEmpty){
      return;
    }

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 1,
        bottom: 14,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Send a message...',
              ),
              autocorrect: true,
              textCapitalization: TextCapitalization.sentences,
              enableSuggestions: true,
              controller: messageController,
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.send,
              color: Color.fromARGB(255, 108, 99, 255),
            ),
          )
        ],
      ),
    );
  }
}
