import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:note_add/constants/app_label.dart';
import 'package:note_add/controllers/page_generator.dart';
import 'package:note_add/core/user.dart';
import 'package:note_add/core/user_preferences.dart';
import 'package:note_add/utils/api.dart';
import 'package:note_add/utils/jwt_decode.dart';
import 'package:note_add/widgets/share/style.dart';
import 'package:note_add/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final _formKey = GlobalKey();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    late ScaffoldMessengerState scaffoldMessenger =
        ScaffoldMessenger.of(context);
    setState(() {
      isLoading = true;
    });

    final String email = emailController.text;
    final String password = passwordController.text;

    if (emailController.text.isEmpty) {
      setState(() {
        isLoading = false;
      });
      scaffoldMessenger
          .showSnackBar(const SnackBar(content: Text("Please Enter email")));
    }

    if (passwordController.text.isEmpty) {
      setState(() {
        isLoading = false;
      });
      scaffoldMessenger
          .showSnackBar(const SnackBar(content: Text("Please Enter Password")));
    } else {
      setState(() {
        isLoading = true;
      });
      final response = await http.post(Uri.parse(Network.login),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{'email': email, 'password': password}));

      // Save token in local storage and manage it
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });

        User user = User.fromJson(jsonDecode(response.body));
        UserPreferences.setToken(user.token!);

        fkJwtDecode(tokenKey: user.token);
        // ignore: use_build_context_synchronously
        PageGenerator.directTo(context,
            pathName: "/",
            itemData: {"data": user.data},
            provider: "auth",
            token: user.token);
      } else if (response.statusCode == 400) {
        User user = User.fromJson(jsonDecode(response.body));
        setState(() {
          isLoading = false;
        });

        scaffoldMessenger.showSnackBar(SnackBar(
          content: Text(
            "${user.error}",
            style: TextStyle(color: Colors.red),
          ),
        ));
      } else {
        setState(() {
          isLoading = false;
        });
        scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text(
            "Error from server.",
            style: TextStyle(color: Colors.red),
          ),
        ));
      }
    }
  }

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
                key: _formKey,
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
                            inputController: passwordController,
                            inputName: "pwd",
                            hintText: "Password",
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                    TextButton(
                      onPressed: isLoading == false ? () => login() : () {},
                      child: isLoading == false
                          ? Container(
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
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black,
                              padding: const EdgeInsets.all(16.0),
                              child: const Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.0,
                                      ),
                                    ),
                                  )),
                            ),
                    ),
                    verticalSpaceRegular,
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                        onPressed: () =>
                            PageGenerator.goTo(context, pathName: "/sign-up"),
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
