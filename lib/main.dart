import 'package:flutter/material.dart';
import 'package:resume/screen/menus.dart';

void main() {
  runApp(MaterialApp(
    title: "Simple App",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Simple App"),
      ),
      body: Menu(),
    ),
  ));
}
