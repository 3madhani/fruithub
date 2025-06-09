import 'package:flutter/material.dart';

class InActiveShippItemDot extends StatelessWidget {
  const InActiveShippItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      padding: const EdgeInsets.all(3.5),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(side: BorderSide(color: Color(0xff949D9E), width: 1)),
      ),
    );
  }
}
