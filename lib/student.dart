import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login (2).dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}
 var title ='Student';

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title:  Text(title),
        leading: Icon(Icons.menu),
        actions: [
          
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                  curve: Curves.bounceInOut,
                  speed: const Duration(microseconds: 150000),
                  'HELLO USER! \nWelcome back you\'ve been missed:)',
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                  )),
            ],
            onTap: () {},
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    const CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
