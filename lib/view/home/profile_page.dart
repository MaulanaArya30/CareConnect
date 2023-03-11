import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../widgets/orphan_button.dart';
import '../../widgets/orphanage_button.dart';
import 'detail_orphanage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

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
              child: Image(
                image: AssetImage('assets/images/title.png'),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 30,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(255, 202, 0, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Find A Place or Orphanages",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      fontFamily: 'Nunito'),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 105,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color.fromARGB(255, 37, 157, 217),
              ),
              child: Center(
                  child: Text(
                "Map",
                style: TextStyle(color: Colors.white),
              )),
            ),
            SizedBox(height: 10),
            Container(
              height: 276,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(top: 0),
                children: <Widget>[
                  OrphanageButton(id: "0"),
                  OrphanageButton(id: '1'),
                  OrphanageButton(id: '2'),
                  OrphanageButton(id: '3'),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 128,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  OrphanButton(id: "0"),
                  OrphanButton(id: '1'),
                  OrphanButton(id: '2'),
                  OrphanButton(id: '3'),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 40,
              child: RawMaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.0),
                ),
                fillColor: Color.fromRGBO(130, 195, 65, 1),
                onPressed: () {},
                child: Text(
                  "Donate Now",
                  style: TextStyle(
                    color: Color.fromRGBO(77, 77, 77, 1),
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Nunito',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 40,
              child: RawMaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.0),
                ),
                fillColor: Color.fromRGBO(255, 202, 0, 1),
                onPressed: () => FirebaseAuth.instance.signOut(),
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
          ],
        ),
      ),
    );
  }
}
