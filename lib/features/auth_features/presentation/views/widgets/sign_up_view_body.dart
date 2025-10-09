import 'package:fire_test/core/utils/functions/messages.dart';
import 'package:fire_test/core/utils/functions/validation.dart';
import 'package:fire_test/features/auth_features/presentation/views/Log_in_view.dart';
import 'package:fire_test/features/auth_features/presentation/views/widgets/custom_button.dart';
import 'package:fire_test/features/auth_features/presentation/views/widgets/custom_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: key,
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 40,
              child: Image.asset("images/363640-200.png"),
            ),
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

            CustomTextField(
              validator: Validation.validateName,
              controller: nameController,
              hintTxt: "Enter Your Name",
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, bottom: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            CustomTextField(
              validator: Validation.validateEmail,
              controller: emailController,
              hintTxt: "Enter Your Email",
            ),
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
            CustomTextField(
              obscureText: isPasswordHidden,
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
              ),
              validator: Validation.validatePassword,
              controller: passwordController,
              hintTxt: "Enter Your Password",
            ),
            SizedBox(height: 20),
            CustomButton(
              onTap: () async {
                if (key.currentState!.validate()) {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                    // FirebaseAuth.instance.currentUser!.sendEmailVerification();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LogInView();
                        },
                      ),
                    );
                    return Messages.extractSnackBar(context, text: "Successed");
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      return Messages.extractSnackBar(
                        context,
                        text:
                            ""
                            'The password provided is too weak.'
                            "",
                      );
                    } else if (e.code == 'email-already-in-use') {
                      return Messages.extractSnackBar(
                        context,
                        text: "'The account already exists for that email.'",
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                }
              },
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
                  Image.asset("images/270014.png", height: 30),
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LogInView();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "LogIn",
                    style: TextStyle(color: Color(0xff273b7a), fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
