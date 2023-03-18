import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DonateDetail extends StatefulWidget {
  const DonateDetail({super.key});

  @override
  State<DonateDetail> createState() => _DonateDetailState();
}

class _DonateDetailState extends State<DonateDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 119, 194, 1),
      body: Stack(
        children: [
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
              padding: EdgeInsets.all(37),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 88),
                  Center(
                    child: Text(
                      "Donate",
                      style: TextStyle(
                        color: Color.fromRGBO(130, 195, 65, 1),
                        fontWeight: FontWeight.w900,
                        fontSize: 50,
                        fontFamily: "Nunito",
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Payment Info",
                      style: TextStyle(
                        color: Color.fromRGBO(130, 195, 65, 1),
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        fontFamily: "Nunito",
                      ),
                    ),
                  ),
                  SizedBox(height: 45),
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Total Amount : ',
                      style: TextStyle(
                        color: Color.fromRGBO(77, 77, 77, 1),
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
