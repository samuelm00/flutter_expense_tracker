import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/config/get_it/get_it.dart';
import "./app/app.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies();

  runApp(const MyApp());
}
