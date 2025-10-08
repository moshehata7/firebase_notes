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

          CustomTextField(
            validator: validateName,
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
            validator: validateEmail,
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
            validator: validatePassword,
            controller: passwordController,
            hintTxt: "Enter Your Password",
          ),
          SizedBox(height: 20),
          CustomButton(
            onTap: () async {
              try {
                final credential = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  return customSnackBar(
                    context,
                    text:
                        ""
                        'The password provided is too weak.'
                        "",
                  );
                } else if (e.code == 'email-already-in-use') {
                  return customSnackBar(
                    context,
                    text: "'The account already exists for that email.'",
                  );
                }
              } catch (e) {
                print(e);
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
          SizedBox(height: 20),
        ],
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
    BuildContext context, {
    required String text,
  }) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(text)));
  }

  String? validatePassword(
    String? value, {
    int minLength = 8,
    bool requireUpper = true,
    bool requireDigit = true,
    bool requireSpecial = true,
  }) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < minLength) {
      return 'كلمة المرور يجب أن تكون على الأقل $minLength أحرف';
    }
    if (requireUpper && !RegExp(r'[A-Z]').hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';
    }
    if (requireDigit && !RegExp(r'\d').hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    final v = value.trim();
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
      r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?"
      r"(?:\.[a-zA-Z]{2,})+$",
    );
    if (!emailRegExp.hasMatch(v)) {
      return 'أدخل بريدًا إلكترونيًا صحيحًا';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الاسم مطلوب';
    }
    final v = value.trim();
    if (v.length < 2) {
      return 'الاسم لازم يكون على الأقل حرفين';
    }
    final nameRegExp = RegExp(r"^[\p{L} .'-]+$", unicode: true);
    if (!nameRegExp.hasMatch(v)) {
      return 'الاسم يجب أن يحتوي حروفاً ومسافات فقط';
    }
    return null;
  }
}
