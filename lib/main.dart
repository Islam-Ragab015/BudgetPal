import 'package:budget_pal/core/routing/routing.dart';
import 'package:budget_pal/firebase_options.dart';
import 'package:budget_pal/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    routing: Routing(),
  ));
}
