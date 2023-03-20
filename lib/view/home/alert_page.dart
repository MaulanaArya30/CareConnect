import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gdscapp/repository/alert_controller.dart';
import 'package:gdscapp/widgets/map_widget.dart';
import 'package:get/get.dart';

import '../../models/alert_model.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
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
                  "Choose Orphanage",
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
              height: 150,
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
                      hintText: "Reporter Name",
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
                    controller: controller.rphone,
                    decoration: InputDecoration(
                      hintText: "Phone Number",
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
            SizedBox(height: 13),
            Container(
              height: 300,
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
                    controller: controller.oname,
                    decoration: InputDecoration(
                      hintText: "Orphan Name",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Nunito',
                        color: Color.fromRGBO(77, 77, 77, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: controller.obirth,
                    decoration: InputDecoration(
                      hintText: "Date of Birth",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Nunito',
                        color: Color.fromRGBO(77, 77, 77, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    controller: controller.oconditions,
                    decoration: InputDecoration(
                      hintText: "Conditions",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Nunito',
                        color: Color.fromRGBO(77, 77, 77, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: controller.olocation,
                    decoration: InputDecoration(
                      hintText: "Locations",
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
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromRGBO(130, 195, 65, 1),
                borderRadius: BorderRadius.circular(23.0),
              ),
              child: Center(
                child: Text(
                  "Choose Orphan Location",
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
            MapWidget(),
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
                    final alert = AlertModel(
                      rname: controller.rname.text.trim(),
                      rphone: controller.rphone.text.trim(),
                      oname: controller.oname.text.trim(),
                      obirth: controller.obirth.text.trim(),
                      oconditions: controller.oconditions.text.trim(),
                      olocation: controller.olocation.text.trim(),
                    );
                    AlertController.instance.createAlert(alert);
                    setState(() {
                      controller.rname.clear();
                      controller.rphone.clear();
                      controller.oname.clear();
                      controller.obirth.clear();
                      controller.oconditions.clear();
                      controller.olocation.clear();
                    });
                  },
                  child: Text(
                    "Give Alert",
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
