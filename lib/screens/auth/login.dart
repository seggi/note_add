import 'package:flutter/material.dart';
import 'package:note_add/constants/app_label.dart';
import 'package:note_add/widgets/share/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: fkDefaultColor,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 80),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  appName,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
