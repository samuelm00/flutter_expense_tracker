import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "./app/app.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // dont allow landscape mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}
