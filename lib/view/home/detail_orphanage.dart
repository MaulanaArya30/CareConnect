import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/map_widget.dart';
import '../../widgets/orphan_button.dart';

class DetailOrphanage extends StatefulWidget {
  final String documentId;

  DetailOrphanage({required this.documentId});

  @override
  _DetailOrphanageState createState() => _DetailOrphanageState();
}

class _DetailOrphanageState extends State<DetailOrphanage> {
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 119, 194, 1),
      body: SingleChildScrollView(
        child: Center(
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('orphanage')
                .doc(widget.documentId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.fromLTRB(13, 50, 13, 13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        height: 215,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Color.fromRGBO(240, 242, 244, 1),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 119,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              margin: EdgeInsets.all(10.0),
                              child: _imageFile == null
                                  ? Center(child: CircularProgressIndicator())
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.file(
                                        _imageFile!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                            Text(
                              '${snapshot.data!['name']}',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: Color.fromRGBO(77, 77, 77, 1),
                                fontFamily: 'Nunito',
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              // '${snapshot.data!['name']}',
                              '__ km away from you',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14,
                                  color: Color.fromRGBO(77, 77, 77, 1),
                                  fontFamily: 'Nunito'),
                            ),
                            SizedBox(height: 5),
                            Text(
                              // '${snapshot.data!['name']}',
                              'need ___, __, and ___',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                fontFamily: 'Nunito',
                                color: Color.fromRGBO(77, 77, 77, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 165,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(240, 242, 244, 1),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(45, 11, 45, 12),
                            child: Text(
                              'Description: ${snapshot.data!['description']}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 9,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 13),
                      MapWidget(),
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
                          onPressed: () => Navigator.pop(context),
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
      ),
    );
  }
}
