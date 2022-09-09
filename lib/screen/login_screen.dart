import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_base3/screen/home_page_login.dart';

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controllerGmail = TextEditingController();
    final _controllerPassword = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(
              controller: _controllerGmail,
              decoration: const InputDecoration(
                label: Text('Gmail'),
              ),
            ),
            TextField(
              controller: _controllerPassword,
              decoration: const InputDecoration(
                label: Text('Password'),
              ),
            ),
            CupertinoButton(
                color: Colors.purple,
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Login(_controllerGmail.text.trim(),
                      _controllerPassword.text.trim(), context);
                }),
          ]),
        ),
      ),
    );
  }

  Future Login(
      String emailAddress, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const MyHomeLogin())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
  }
}
