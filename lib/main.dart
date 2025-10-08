import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp( MyFireApp());
}

class MyFireApp extends StatelessWidget {
  const MyFireApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

