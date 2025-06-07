import 'package:flutter/material.dart';

class CartActionButton extends StatelessWidget {
  final IconData icon;
  final Color color, iconColor;
  final VoidCallback? onPressed;
  const CartActionButton({
    super.key,
    required this.icon,
    required this.color,
    this.onPressed,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: FittedBox(child: Icon(icon, color: iconColor)),
    );
  }
}
