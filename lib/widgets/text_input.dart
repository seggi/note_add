import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormInputField extends StatefulWidget {
  TextEditingController inputController;
  String inputName;
  FormInputField(
      {Key? key, required this.inputController, required this.inputName})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FormInputFieldState createState() => _FormInputFieldState();
}

class _FormInputFieldState extends State<FormInputField> {
  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = widget.inputController;
    String inputName = widget.inputName;
    return TextFormField(
      obscureText: inputName == "email" ? false : true,
      controller: inputController,
      keyboardType: inputName == "email"
          ? TextInputType.emailAddress
          : TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText:
              inputName == "email" ? 'example@test.com' : "Enter password",
          suffixIcon: inputName == "email"
              ? const Icon(Icons.email, color: Colors.black)
              : const Icon(Icons.lock, color: Colors.black),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(0.0))),
    );
  }
}
