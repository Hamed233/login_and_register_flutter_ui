import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  const HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text(
            'Hello $username, Successfully Login!'
          ),
        ),
      ),
    );
  }
}