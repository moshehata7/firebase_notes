import 'package:fire_test/features/auth_features/presentation/views/Log_in_view.dart';
import 'package:fire_test/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,  

  );
  
  runApp( MyFireApp());
}

class MyFireApp extends StatelessWidget {
  const MyFireApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInView(),
    );
  }
}

