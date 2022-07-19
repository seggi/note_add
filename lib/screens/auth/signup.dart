import 'package:flutter/material.dart';
import 'package:note_add/constants/app_label.dart';
import 'package:note_add/controllers/page_generator.dart';
import 'package:note_add/widgets/share/style.dart';
import 'package:note_add/widgets/text_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: naDefaultColor,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.symmetric(vertical: 80),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  appLabel['text']![0],
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
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
                            inputName: "email",
                            hintText: "Enter email",
                          ),
                          verticalSpaceSmall,
                          FormInputField(
                            inputController: usernameController,
                            inputName: "Username",
                            hintText: "Username",
                          ),
                          verticalSpaceSmall,
                          FormInputField(
                            inputController: passwordController,
                            inputName: "pwd",
                            hintText: "Password",
                          ),
                          verticalSpaceSmall,
                          FormInputField(
                            inputController: passwordController,
                            inputName: "repPwd",
                            hintText: "Repeat password",
                          ),
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
                              "Sign Up",
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
                        onPressed: () =>
                            PageGenerator.goTo(context, pathName: "/login"),
                        child: const Text(
                          "Already have an account? click here",
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
