import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fire_test/core/utils/functions/validation.dart';
import 'package:fire_test/features/auth_features/presentation/views/sign_up_view.dart';
import 'package:fire_test/features/auth_features/presentation/views/widgets/custom_button.dart';
import 'package:fire_test/features/auth_features/presentation/views/widgets/custom_field.dart';
import 'package:fire_test/features/home_feature/presentation/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogInViewBody extends StatefulWidget {
  const LogInViewBody({super.key});

  @override
  State<LogInViewBody> createState() => _LogInViewBodyState();
}

class _LogInViewBodyState extends State<LogInViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  bool isPasswordHidden = true;

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  // if(googleUser==null){
  //      return ;
  //          }

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
  Future<UserCredential> signInWithGoogleWeb() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }

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

            CustomTextField(
              validator: Validation.validateEmail,
              controller: emailController,
              hintTxt: "Email",
            ),
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
              hintTxt: "Password",
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (emailController.text == "") {
                  return ;
                }
                FirebaseAuth.instance.sendPasswordResetEmail(
                  email: emailController.text,
                );
                AwesomeDialog(
                  context: context,
                  title: "Reset password",
                  desc:
                      "تم ارسال رابط للبريد الالكتروني لاعادة تعيين كلمة السر ",
                  animType: AnimType.bottomSlide,
                  dialogType: DialogType.info
                ).show();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("Forget Password ?")],
                ),
              ),
            ),
            SizedBox(height: 10),
            CustomButton(
              onTap: () async {
                if (key.currentState!.validate()) {
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                    // if (credential.user!.emailVerified) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeView();
                        },
                      ),
                    );
                    // } else {
                    //   // FirebaseAuth.instance.currentUser!
                    //   //     .sendEmailVerification();
                    //   return Messages.extractSnackBar(
                    //     context,
                    //     text: "please verify your email",
                    //   );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      return customSnackBar(
                        context,
                        text: "'No user found for that email.'",
                      );
                    } else if (e.code == 'wrong-password') {
                      return customSnackBar(
                        context,
                        text: "'Wrong password provided for that user.'",
                      );
                    }
                  }
                }
              },
              buttonContent: Text(
                "Log In",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              onTap: () async {
                signInWithGoogleWeb();
              },
              buttonContent: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Log In With Google  ",
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
                  "Dont have an account? ",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
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
                    style: TextStyle(color: Color(0xff273b7a), fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
  BuildContext context, {
  required String text,
}) {
  return ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(text)));
}
