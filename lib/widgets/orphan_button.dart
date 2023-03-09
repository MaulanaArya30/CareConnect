import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/home/detail_orphanage.dart';

class OrphanButton extends StatefulWidget {
  final int id;

  const OrphanButton({
    super.key,
    required this.id,
  });

  @override
  State<OrphanButton> createState() => _OrphanButtonState();
}

class _OrphanButtonState extends State<OrphanButton> {
  @override
  Widget build(BuildContext context) {
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
        width: 128,
        margin: EdgeInsets.only(right: 11),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 37, 157, 217),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          "Detail Page ${widget.id}",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
