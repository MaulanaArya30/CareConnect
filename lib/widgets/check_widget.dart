import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CheckWidget extends StatefulWidget {
  final String things;

  const CheckWidget({
    super.key,
    required this.things,
  });

  @override
  State<CheckWidget> createState() => _CheckWidgetState();
}

class _CheckWidgetState extends State<CheckWidget> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          activeColor: Color.fromRGBO(130, 195, 65, 1),
          onChanged: (newBool) {
            setState(() {
              isChecked = newBool;
            });
          },
        ),
        Text(
          "${widget.things}",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontFamily: 'Nunito',
            fontSize: 14,
            color: Color.fromRGBO(77, 77, 77, 1),
          ),
        ),
      ],
    );
  }
}
