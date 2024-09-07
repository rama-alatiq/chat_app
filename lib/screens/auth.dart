import 'package:chat_app/widgets/user_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var enteredEmail = '';
  var enteredPass = '';
  void submit() async {
    final valid = formKey.currentState!.validate();
    if (!valid) {
      return;
    }
    try {
      if (isLogin) {
        final UserCredential userCredential =
            await firebase.signInWithEmailAndPassword(
          email: enteredEmail,
          password: enteredPass,
        );
      } else {
        final UserCredential userCredential =
            await firebase.createUserWithEmailAndPassword(
          email: enteredEmail,
          password: enteredPass,
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Authentication Failed')));
    }
    formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 30,
                  top: 30,
                  right: 20,
                  left: 20,
                ),
                width: 400,
                height: 300,
                child: Image.asset(
                  'assets/images/undraw_Chat_re_re1u.png',
                  fit: BoxFit.cover,
                ),
              ),
              Card(
                color: const Color.fromARGB(255, 255, 255, 255),
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            if(!isLogin) const UserImagePicker(),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email Address',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              onSaved: (value) => enteredEmail = value!,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains('@')) {
                                  return 'Please enter a valid email address';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              obscureText: true,
                              onSaved: (value) => enteredPass = value!,
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'Password must be at least 6 characters long';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ElevatedButton(
                              onPressed: submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 108, 99, 255),
                              ),
                              child: Text(
                                isLogin ? 'Login' : 'Signup',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isLogin = !isLogin;
                                });
                              },
                              child: Text(
                                isLogin
                                    ? 'create an account'
                                    : 'I already have an account',
                                style: const TextStyle(
                                  color:
                                      Color.fromARGB(255, 108, 99, 255),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
