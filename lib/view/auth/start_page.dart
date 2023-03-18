import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gdscapp/main.dart';
import 'package:gdscapp/view/auth/auth_page.dart';
import 'package:gdscapp/view/auth/login_page.dart';
import 'package:gdscapp/view/auth/signup_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 119, 194, 1),
      body: Stack(children: <Widget>[
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
                Container(
                  child: Image(
                    image: AssetImage('assets/images/title.png'),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/images/vector.png'),
                  ),
                ),
                SizedBox(height: 84),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: double.infinity,
                  height: 48,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(13.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    fillColor: Color.fromRGBO(255, 202, 0, 1),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text(
                      "Welcome!!",
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
      ]),
    );
  }
}
