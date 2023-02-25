import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'detail_page.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Main Home Page"),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: const Color.fromARGB(255, 37, 157, 217),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyDetailPage(documentId: "1")),
                    );
                  },
                  child: const Text(
                    "Detail Page 1",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: const Color.fromARGB(255, 37, 157, 217),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyDetailPage(documentId: "2")),
                    );
                  },
                  child: const Text(
                    "Detail Page 2",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
      ),
    );
  }
}
