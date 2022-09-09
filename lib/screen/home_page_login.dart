import 'package:flutter/material.dart';

class MyHomeLogin extends StatelessWidget {
  const MyHomeLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(actions: const [
         Text('hi')
      ]),
      body: const Center(child: Text('login sucess')),
    );
  }
}
