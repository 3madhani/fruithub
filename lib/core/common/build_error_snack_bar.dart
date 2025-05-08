import 'package:flutter/material.dart';

void buildErrorSnackBar(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(duration: const Duration(seconds: 2), content: Text(error)),
  );
}
