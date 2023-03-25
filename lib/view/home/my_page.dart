import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gdscapp/repository/alert_controller.dart';
import 'package:gdscapp/widgets/map_widget.dart';
import 'package:get/get.dart';

import '../../models/alert_model.dart';
import '../../widgets/check_widget.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final controller = Get.put(AlertController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 119, 194, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromRGBO(130, 195, 65, 1),
                borderRadius: BorderRadius.circular(23.0),
              ),
              child: Center(
                child: Text(
                  "Your Profile",
                  style: TextStyle(
                    color: Color.fromRGBO(77, 77, 77, 1),
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Nunito',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 800,
              width: double.infinity,
              padding: EdgeInsets.all(21),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controller.rname,
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Nunito',
                        color: Color.fromRGBO(77, 77, 77, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controller.rphone,
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Nunito',
                        color: Color.fromRGBO(77, 77, 77, 1),
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.oname,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Nunito',
                        color: Color.fromRGBO(77, 77, 77, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: controller.obirth,
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Nunito',
                        color: Color.fromRGBO(77, 77, 77, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Donation Preference",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      color: Color.fromRGBO(77, 77, 77, 1),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckWidget(things: "clothings"),
                          CheckWidget(things: "activities"),
                          CheckWidget(things: "sponsor"),
                          CheckWidget(things: "operational"),
                          CheckWidget(things: "health"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckWidget(things: "infrastructure"),
                          CheckWidget(things: "education"),
                          CheckWidget(things: "food"),
                          CheckWidget(things: "facilities"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    controller: controller.oconditions,
                    decoration: InputDecoration(
                      hintText: "Name On Card",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Nunito',
                        color: Color.fromRGBO(77, 77, 77, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.olocation,
                    decoration: InputDecoration(
                      hintText: "Card Number",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Nunito',
                        color: Color.fromRGBO(77, 77, 77, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.olocation,
                    decoration: InputDecoration(
                      hintText: "Security Code",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Nunito',
                        color: Color.fromRGBO(77, 77, 77, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.olocation,
                    decoration: InputDecoration(
                      hintText: "Expiration Date",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Nunito',
                        color: Color.fromRGBO(77, 77, 77, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 202, 0, 1),
                borderRadius: BorderRadius.circular(23.0),
              ),
              child: Center(
                child: InkWell(
                  onTap: () {
                    // final alert = AlertModel(
                    //   rname: controller.rname.text.trim(),
                    //   rphone: controller.rphone.text.trim(),
                    //   oname: controller.oname.text.trim(),
                    //   obirth: controller.obirth.text.trim(),
                    //   oconditions: controller.oconditions.text.trim(),
                    //   olocation: controller.olocation.text.trim(),
                    // );
                    // AlertController.instance.createAlert(alert);
                    // setState(() {
                    //   controller.rname.clear();
                    //   controller.rphone.clear();
                    //   controller.oname.clear();
                    //   controller.obirth.clear();
                    //   controller.oconditions.clear();
                    //   controller.olocation.clear();
                    // });
                  },
                  child: Text(
                    "Save Profile",
                    style: TextStyle(
                      color: Color.fromRGBO(77, 77, 77, 1),
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Nunito',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
