import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gdscapp/view/auth/forgotpassword_page.dart';
import 'package:gdscapp/view/auth/forgotpassword_page.dart';
import 'package:gdscapp/view/auth/forgotpassword_page.dart';
import 'package:gdscapp/view/auth/forgotpassword_page.dart';
import 'package:gdscapp/view/home/profile_page.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  final Function() onClickedSignUp;

  const LoginScreen({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Textfield Controllers

    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 119, 194, 1),
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(50.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 130),
                  Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Lato',
                      color: Color.fromRGBO(130, 195, 65, 1),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Color.fromRGBO(240, 242, 244, 1),
                    style: TextStyle(
                      color: Color.fromRGBO(240, 242, 244, 1),
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(240, 242, 244, 1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(240, 242, 244, 1),
                        ),
                      ),
                      hintText: "                    Email Address",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(240, 242, 244, 1),
                      ),
                      // prefixIcon: Icon(
                      //   Icons.mail,
                      //   color: Color.fromRGBO(240, 242, 244, 1),
                      // ),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    style: TextStyle(
                      color: Color.fromRGBO(240, 242, 244, 1),
                    ),
                    cursorColor: Color.fromRGBO(240, 242, 244, 1),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(240, 242, 244, 1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(240, 242, 244, 1),
                        ),
                      ),
                      hintText: "                        Password",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(240, 242, 244, 1),
                      ),
                      // prefixIcon: Icon(
                      //   Icons.lock,
                      //   color: Color.fromRGBO(240, 242, 244, 1),
                      // ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: double.infinity,
                    height: 48,
                    child: RawMaterialButton(
                      padding: EdgeInsets.all(13.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      fillColor: Color.fromRGBO(255, 202, 0, 1),
                      onPressed: logIn,
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          color: Color.fromRGBO(77, 77, 77, 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 217),
                  GestureDetector(
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 202, 0, 1),
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen(),
                    )),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      text: "No Account?",
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignUp,
                          text: " Sign Up",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 202, 0, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Future logIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    //Mavigator
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
