import 'package:fire_test/features/auth_features/presentation/views/sign_up_view.dart';
import 'package:fire_test/features/auth_features/presentation/views/widgets/custom_button.dart';
import 'package:fire_test/features/auth_features/presentation/views/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(radius: 40, child: Image.asset("images/363640-200.png")),
          SizedBox(height: 20),
          Text(
            "Log In",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
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

          CustomTextField(hintTxt: "Email"),
          SizedBox(height: 15),
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
          CustomTextField(hintTxt: "Password"),
          SizedBox(height: 20),
          CustomButton(
            buttonContent: Text(
              "Log In",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          CustomButton(
            buttonContent: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Log In With Google  ",
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
                "Dont have an account? ",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpView();
                      },
                    ),
                  );
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
