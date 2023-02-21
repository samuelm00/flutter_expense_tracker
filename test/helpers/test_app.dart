import 'package:flutter/material.dart';

class TestApp {
  static Widget getTestApp(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: child),
      ),
    );
  }
}
