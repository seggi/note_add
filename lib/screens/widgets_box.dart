import 'package:flutter/material.dart';

class NaContentBoxWidgets {
  static Widget body(context, screenName,
      {widTxt = "", List<Widget> itemList = const [], fn}) {
    if (screenName == "home") {
      return Scaffold(
        body: SafeArea(
          child: SizedBox(
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
