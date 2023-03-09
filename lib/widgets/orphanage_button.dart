import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/home/detail_orphanage.dart';

class OrphanageButton extends StatefulWidget {
  final String id;

  const OrphanageButton({
    super.key,
    required this.id,
  });

  @override
  State<OrphanageButton> createState() => _OrphanageButtonState();
}

class _OrphanageButtonState extends State<OrphanageButton> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();

    // Get a reference to the image location in Firebase Storage
    Reference ref =
        FirebaseStorage.instance.ref().child('images/${widget.id}.jpg');

    // Download the image to a temporary directory on the device
    final Directory systemTempDir = Directory.systemTemp;
    final File file = File('${systemTempDir.path}/${widget.id}.jpg');
    ref.writeToFile(file).then((_) {
      setState(() {
        _imageFile = file;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('orphanage')
          .doc(widget.id)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailOrphanage(documentId: "${widget.id}")),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              height: 128,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color.fromARGB(255, 37, 157, 217),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: _imageFile == null
                          ? Center(child: CircularProgressIndicator())
                          : Image.file(_imageFile!),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Title:  ${snapshot.data!['name']}",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: Text(
                            'Detail: ${snapshot.data!['widgetdesc']}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: 15,
                                margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: 15,
                                margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
