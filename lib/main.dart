import 'package:chat_app/screens/auth.dart';
import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        
      ),
      //futureBuilder will only give me one data unlike the streanBuilder it will always be updated
      home: StreamBuilder(
       // it will observe the changes of auth state  
      stream: FirebaseAuth.instance.authStateChanges(),
       builder: ((context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return const SplashScreen();
        }
        if(snapshot.hasData){
          return const ChatScreen();
       }
        return const AuthScreen();
       }),
       
       ),
    );
  }
}

