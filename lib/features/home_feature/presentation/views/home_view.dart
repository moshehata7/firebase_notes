import 'package:fire_test/features/auth_features/presentation/views/Log_in_view.dart';
import 'package:fire_test/features/home_feature/presentation/views/widgets/custom_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){

      },
      backgroundColor: Colors.blue,
      child: Icon(Icons.add,color: Colors.white,),
      ),
      appBar: AppBar(
        title: Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.blue)),
        actions: [
          IconButton(
            onPressed: () async {
              // GoogleSignIn googleSignIn = GoogleSignIn();
              // googleSignIn.disconnect();
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
            icon: Icon(Icons.exit_to_app,color: Colors.blue,),
          ),
        ],
      ),
      body: GridView(
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 160
          ),
        children: [
          CustomCard(txt: "Home"),
          CustomCard(txt: "Company")
        ],
        ),
    );
  }
}
