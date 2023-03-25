import 'dart:convert';
import 'dart:io';
import 'package:gdscapp/view/home/my_page.dart';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gdscapp/view/home/alert_page.dart';
import 'package:gdscapp/view/home/donate_page.dart';
import 'package:gdscapp/view/home/search_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/map_widget.dart';
import '../../widgets/orphan_button.dart';
import '../../widgets/orphanage_button.dart';
import 'detail_orphanage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  LatLng currentPoint = LatLng(0, 0);

  var url = "https://apporphan.pythonanywhere.com/";

  Future<List<String>> Getdata(url) async {
    http.Response Response = await http.get(Uri.parse(url));
    var data = Response.body;
    var DecodedData = jsonDecode(data)['index'];
    List<String> indexList = new List<String>.from(DecodedData);
    print(indexList);
    return indexList;
  }

  void _updatePoint(LatLng newValue) {
    setState(() {
      currentPoint = newValue;
    });
  }

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
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyScreen()),
                      );
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
                        Icons.person,
                        color: Color.fromARGB(77, 77, 77, 1),
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchScreen()),
                      );
                    },
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 202, 0, 1),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Find A Place or Orphanages",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            fontFamily: 'Nunito'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            MapWidget(),
            SizedBox(height: 10),
            Container(
              height: 276,
              width: double.infinity,
              child: FutureBuilder<List<String>>(
                future: Getdata(url),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.data == null) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return ListView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(top: 0),
                      children: <Widget>[
                        OrphanageButton(id: snapshot.data![0]),
                        OrphanageButton(id: snapshot.data![1]),
                        OrphanageButton(id: snapshot.data![2]),
                        OrphanageButton(id: snapshot.data![3]),
                      ],
                    );
                  } else {
                    return Center(
                      child: Text('No data'),
                    );
                  }
                },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonateScreen()),
                  );
                },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlertScreen()),
                  );
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
          ],
        ),
      ),
    );
  }
}
