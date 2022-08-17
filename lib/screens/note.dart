import 'package:flutter/material.dart';
import 'package:note_add/screens/widgets_box.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return NaContentBoxWidgets.body(context, "home", itemList: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [],
        ),
      )
    ]);
  }
}
