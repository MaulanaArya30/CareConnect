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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              "oCare",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'OleoScript',
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 45,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Alert? / Search Bar?",
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 128,
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
                  OrphanageButton(id: "1"),
                  OrphanageButton(id: '0'),
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
                  OrphanButton(id: 1),
                  OrphanButton(id: 2),
                  OrphanButton(id: 3),
                  OrphanButton(id: 0),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                padding: EdgeInsets.all(18.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.0),
                ),
                fillColor: const Color.fromARGB(255, 37, 157, 217),
                onPressed: () {},
                child: const Text(
                  "Donate Now",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color.fromARGB(255, 37, 157, 217),
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
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
