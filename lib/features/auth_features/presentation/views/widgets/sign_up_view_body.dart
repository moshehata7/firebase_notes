import 'package:fire_test/features/auth_features/presentation/views/widgets/custom_button.dart';
import 'package:fire_test/features/auth_features/presentation/views/widgets/custom_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(radius: 40, child: Image.asset("images/363640-200.png")),
          SizedBox(height: 20),
          Text(
            "Sign Up",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 8, bottom: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "UserName",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          CustomTextField(hintTxt: "Enter Your Name"),
        
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 8, bottom: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Email",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          CustomTextField(hintTxt: "Enter Your Email"),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, bottom: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          CustomTextField(hintTxt: "Enter Your Password"),
          SizedBox(height: 20),
          CustomButton(
            buttonContent: Text(
              "Sign Up",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          CustomButton(
            buttonContent: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up With Google  ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Image.asset("images/images.png", height: 30),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "have an account? ",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "LogIn",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                ),
                
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
    
  }
}
