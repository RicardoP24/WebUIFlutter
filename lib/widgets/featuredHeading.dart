import 'package:ui_test/widgets/responsive.dart';
import 'package:flutter/material.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child:  Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          const Text(
            'Atividades',
            style: TextStyle(
                fontSize: 36,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color:Color(0xFF263b5e)
            ),
          ),
          if (this.screenSize.width<=800) Container() else const Expanded(
            child: Text(
              'Golden Service em trabalhos de campo',
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}