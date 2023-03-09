import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:email_validator/email_validator.dart';
import 'package:basic_utils/basic_utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.all(40.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 130),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Lato',
                      color: Color.fromRGBO(130, 195, 65, 1),
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.done,
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
                      hintText: "                        Email Address",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(240, 242, 244, 1),
                      ),
                      // prefixIcon: Icon(
                      //   Icons.lock,
                      //   color: Color.fromRGBO(240, 242, 244, 1),
                      // ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    child: Text(
                      "Go back",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(255, 202, 0, 1),
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  SizedBox(height: 140),
                  Container(
                    width: double.infinity,
                    height: 48,
                    child: RawMaterialButton(
                      padding: EdgeInsets.all(13.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      fillColor: Color.fromRGBO(255, 202, 0, 1),
                      onPressed: resetPassword,
                      child: Text(
                        "Reset Password",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          color: Color.fromRGBO(77, 77, 77, 1),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email Sent')),
      );
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      print(e);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occured')),
      );
      Navigator.of(context).pop();
    }
  }
}
