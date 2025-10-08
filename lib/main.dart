import 'package:fire_test/features/auth_features/presentation/views/Log_in_view.dart';
import 'package:fire_test/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,  

  );
  
  runApp( MyFireApp());
}

class MyFireApp extends StatefulWidget {
  const MyFireApp({super.key});

  @override
  State<MyFireApp> createState() => _MyFireAppState();
}

class _MyFireAppState extends State<MyFireApp> {
  @override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInView(),
    );
  }
}

