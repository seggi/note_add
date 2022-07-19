import 'package:flutter/material.dart';
import 'package:note_add/constants/app_label.dart';
import 'package:note_add/controllers/page_generator.dart';
import 'package:note_add/widgets/share/style.dart';
import 'package:note_add/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: naDefaultColor,
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
            SizedBox(
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          FormInputField(
                              inputController: emailController,
                              inputName: "email"),
                          verticalSpaceSmall,
                          FormInputField(
                              inputController: emailController,
                              inputName: "pwd"),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                    TextButton(
                        onPressed: () {
                          PageGenerator.directTo(context, pathName: "/");
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                          padding: const EdgeInsets.all(16.0),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    verticalSpaceRegular,
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Don't have an account? click here",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
