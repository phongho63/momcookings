import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/global.dart';

class MaluButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressEvent;
  final double buttonHeight;
  final Color color;
  MaluButton(
      {required this.text,
        required this.onPressEvent,
        this.buttonHeight = 50,
        required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(27, 0, 27, 10),
      child: InkWell(
        onTap: onPressEvent,
        child: Container(
          width: double.infinity,
          height: buttonHeight,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: HexColor(Global.mColors['gray_1'].toString()),
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
