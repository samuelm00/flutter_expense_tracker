import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/logger/logging_observer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "./app/app.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      observers: [LoggingObserver()],
      child: const MyApp(),
    ),
  );
}
