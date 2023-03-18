import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/home/detail_orphanage.dart';

class OrphanButton extends StatefulWidget {
  final String id;

  const OrphanButton({
    super.key,
    required this.id,
  });

  @override
  State<OrphanButton> createState() => _OrphanButtonState();
}

class _OrphanButtonState extends State<OrphanButton> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();

    // Get a reference to the image location in Firebase Storage
    Reference ref =
        FirebaseStorage.instance.ref().child('orphans/${widget.id}.jpg');

    // Download the image to a temporary directory on the device
    final Directory systemTempDir = Directory.systemTemp;
    final File file = File('${systemTempDir.path}/${widget.id}o.jpg');
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
          .collection('orphan')
          .doc(widget.id)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: _imageFile == null
                ? Center(child: CircularProgressIndicator())
                : GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           DetailOrphanage(documentId: "${widget.id}")),
                      // );
                    },
                    child: Container(
                      width: 128,
                      height: 128,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(right: 11),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(240, 242, 244, 1),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: FileImage(_imageFile!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Text(
                          "${snapshot.data!['name']}, ${snapshot.data!['age']}",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Color.fromRGBO(255, 202, 0, 1),
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                      ),
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
