import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'login (2).dart';




class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(

                  curve: Curves.bounceInOut,
                  speed: const Duration(microseconds: 150000),'HELLO Admin! Please Optimise Users:)',
                  textStyle: const TextStyle(
                    color: Colors.black,
                    backgroundColor: Colors.white,
                    fontSize: 40,
                  )),

            ],
            onTap: () {
            },
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
        builder: (context) => LoginPage(),
      ),
    );
  }
}
