import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormInputField extends StatefulWidget {
  TextEditingController inputController;
  String inputName;
  String? hintText;
  FormInputField(
      {Key? key,
      required this.inputController,
      required this.inputName,
      this.hintText})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FormInputFieldState createState() => _FormInputFieldState();
}

class _FormInputFieldState extends State<FormInputField> {
  final inputNames = ["email", "username", "pwd", "repPwd"];
  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = widget.inputController;
    String inputName = widget.inputName;
    final hintText = widget.hintText;

    if (inputNames.contains(inputName)) {
      return TextFormField(
        obscureText: inputName == "pwd" ? true : false,
        controller: inputController,
        keyboardType: inputName == "email"
            ? TextInputType.emailAddress
            : TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            border: OutlineInputBorder(
                // borderSide: const BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(4.0))),
      );
    } else {
      return TextFormField(
        controller: inputController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            border: OutlineInputBorder(
                // borderSide: const BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(4.0))),
      );
    }
  }
}
