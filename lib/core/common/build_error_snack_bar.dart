import 'package:flutter/material.dart';

void buildErrorSnackBar(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
}
