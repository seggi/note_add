import 'package:flutter/material.dart';
import 'package:note_add/widgets/share/style.dart';

const String appName = "Note Add";

class NaContentBoxWidgets {
  static Widget body(context, screenName,
      {widTxt = "", List<Widget> itemList = const [], fn}) {
    if (screenName == "home") {
      return Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.bottomLeft,
            child: Text(appName),
          ),
        ),
        body: SafeArea(
          child: Container(
            color: naPrimaryColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [...itemList],
            ),
          ),
        ),
      );
    } else {
      return widTxt == ""
          ? Scaffold(
              body: SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [...itemList],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: fn,
                backgroundColor: Colors.deepOrangeAccent,
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            )
          : Scaffold(
              body: SafeArea(
                child: Expanded(
                  child: Column(
                    children: [...itemList],
                  ),
                ),
              ),
            );
    }
  }
}
