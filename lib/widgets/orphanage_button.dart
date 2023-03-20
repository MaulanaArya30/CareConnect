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
                color: Color.fromRGBO(240, 242, 244, 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(9, 8, 0, 8),
                      child: _imageFile == null
                          ? Center(child: CircularProgressIndicator())
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: FileImage(_imageFile!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Container(
                          child: Text(
                            "${snapshot.data!['name']}",
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: Color.fromRGBO(77, 77, 77, 1),
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '${snapshot.data!['widgetdesc']}',
                            style: TextStyle(
                              color: Color.fromRGBO(77, 77, 77, 1),
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: 35,
                                margin: EdgeInsets.fromLTRB(0, 13, 17, 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color.fromRGBO(130, 195, 65, 1),
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'Donate',
                                      style: TextStyle(
                                        color: Color.fromRGBO(77, 77, 77, 1),
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Nunito',
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 17),
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: 35,
                                margin: EdgeInsets.fromLTRB(0, 13, 28, 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color.fromRGBO(255, 202, 0, 1),
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'Alert',
                                      style: TextStyle(
                                        color: Color.fromRGBO(77, 77, 77, 1),
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Nunito',
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
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
