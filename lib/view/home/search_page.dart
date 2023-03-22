import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gdscapp/view/home/detail_orphanage.dart';

import '../../widgets/orphanage_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String name = "";
  //List<Map<dynamic, dynamic>> searchresults = [];
  Map<String, File?>? _imageFile = {};

  @override
  void initState() {
    super.initState();

    // Get a reference to the image location in Firebase Storage
    // Reference ref = FirebaseStorage.instance.ref().child('images/.jpg');

    // // Download the image to a temporary directory on the device
    // final Directory systemTempDir = Directory.systemTemp;
    // final File file = File('${systemTempDir.path}/.jpg');
    // ref.writeToFile(file).then((_) {
    //   setState(() {
    //     _imageFile = file;
    //   });
    // });
    FirebaseFirestore.instance
        .collection("orphanage")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Reference ref =
            FirebaseStorage.instance.ref().child('images/${doc.id}.jpg');

        final Directory systemTempDir = Directory.systemTemp;
        final File file = File('${systemTempDir.path}/${doc.id}.jpg');
        ref.writeToFile(file).then((_) {
          setState(() {
            _imageFile![doc.id] = file;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 119, 194, 17),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Container(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/images/title.png'),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.fromLTRB(7, 3, 21, 3),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 1),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Color.fromRGBO(77, 77, 77, 1),
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            fontFamily: 'Nunito'),
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
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("orphanage")
                    .snapshots(),
                builder: (context, snapshot) {
                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          height: 625,
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 0),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data!.docs[index].data()
                                  as Map<dynamic, dynamic>;

                              File? image = _imageFile![data['id']];

                              if (name.isEmpty) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      data['name'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14,
                                        fontFamily: 'Nunito',
                                        color: Color.fromRGBO(77, 77, 77, 1),
                                      ),
                                    ),
                                    // subtitle: Text(
                                    //   data['widgetdesc'],
                                    //   maxLines: 1,
                                    //   overflow: TextOverflow.fade,
                                    // ),
                                    leading: Container(
                                      width: 45,
                                      height: 45,
                                      child: image == null
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Image.file(
                                                image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                    ),
                                  ),
                                );
                              }
                              if (data['name']
                                  .toString()
                                  .startsWith(name.toLowerCase())) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      data['name'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14,
                                        fontFamily: 'Nunito',
                                        color: Color.fromRGBO(77, 77, 77, 1),
                                      ),
                                    ),
                                    // subtitle: Text(
                                    //   data['widgetdesc'],
                                    //   maxLines: 1,
                                    //   overflow: TextOverflow.fade,
                                    // ),
                                    leading: Container(
                                      width: 45,
                                      height: 45,
                                      child: image == null
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Image.file(
                                                image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                    ),
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
