import 'package:fire_test/features/auth_features/presentation/views/Log_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                (MaterialPageRoute(
                  builder: (context) {
                    return LogInView();
                  },
                )),
              );
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
