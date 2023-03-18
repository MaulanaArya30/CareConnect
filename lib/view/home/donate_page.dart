import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gdscapp/view/home/donate_detail.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({super.key});

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 119, 194, 1),
      body: Stack(children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 150),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(38.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Text(
                  "Donate",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Nunito',
                    color: Color.fromRGBO(130, 195, 65, 1),
                  ),
                ),
                SizedBox(height: 30),
                Stack(
                  children: [
                    Container(
                      height: 210,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/card.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 31),
                      child: Text(
                        "Card Type",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color.fromRGBO(77, 77, 77, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 53),
                Container(
                  width: double.infinity,
                  height: 48,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(13.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    fillColor: Color.fromRGBO(130, 195, 65, 1),
                    onPressed: () {},
                    child: const Text(
                      "Choose Orphanages",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(77, 77, 77, 1),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 31),
                Container(
                  width: double.infinity,
                  height: 48,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(13.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    fillColor: Color.fromRGBO(130, 195, 65, 1),
                    onPressed: () {},
                    child: const Text(
                      "Amount",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(77, 77, 77, 1),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 31),
                Container(
                  width: 104,
                  height: 48,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(13.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23.0)),
                    fillColor: Color.fromRGBO(255, 202, 0, 1),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DonateDetail()),
                      );
                    },
                    child: const Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(77, 77, 77, 1),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
