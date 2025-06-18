import 'package:flutter/material.dart';

class CustomSwitcherButton extends StatelessWidget {
  const CustomSwitcherButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 29,
      height: 17,
      decoration: BoxDecoration(
        color: const Color(0xff888FA0).withOpacity(.5),
        border: Border.all(
          color: const Color(0xff888FA0).withOpacity(.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(36.5),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xff888FA0).withOpacity(.5),
              width: .4,
            ),
          ),
        ),
      ),
    );
  }
}
