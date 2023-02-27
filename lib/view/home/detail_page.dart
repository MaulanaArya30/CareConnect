import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailScreen extends StatefulWidget {
  final String documentId;

  DetailScreen({required this.documentId});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();

    // Get a reference to the image location in Firebase Storage
    Reference ref =
        FirebaseStorage.instance.ref().child('images/${widget.documentId}.jpg');

    // Download the image to a temporary directory on the device
    final Directory systemTempDir = Directory.systemTemp;
    final File file = File('${systemTempDir.path}/${widget.documentId}.jpg');
    ref.writeToFile(file).then((_) {
      setState(() {
        _imageFile = file;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_imageFile);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Detail Page'),
      ),
      body: Center(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('orphanage')
              .doc(widget.documentId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${snapshot.data!['name']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.all(30),
                      child: _imageFile == null
                          ? CircularProgressIndicator()
                          : Image.file(_imageFile!),
                    ),
                    SizedBox(height: 20),
                    Text('Description: ${snapshot.data!['description']}'),
                    SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      child: RawMaterialButton(
                        fillColor: const Color.fromARGB(255, 37, 157, 217),
                        onPressed: () {},
                        child: const Text(
                          "Donate",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // other fields
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
