import 'package:ui_test/widgets/responsive.dart';
import 'package:flutter/material.dart';

class MainHeading                                                                                                extends StatelessWidget {
  const MainHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: screenSize.height / 10,
        bottom: screenSize.height / 15,
        left: screenSize.width/15,

      ),
      width: screenSize.width,
      child: const Text(
        'Serviços',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 36,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            color:Color(0xFF263b5e)
        ),
      ),
    );
  }
}