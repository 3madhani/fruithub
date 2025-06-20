import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ReadOnlyEditableField extends StatefulWidget {
  final String label;
  final bool isEditable;
  final VoidCallback onEditTap;
  final Widget suffixIcon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool obscureText;

  const ReadOnlyEditableField({
    super.key,
    required this.label,
    required this.isEditable,
    required this.onEditTap,
    required this.suffixIcon,
    required this.controller,
    required this.focusNode,
    this.obscureText = false,
  });

  @override
  State<ReadOnlyEditableField> createState() => _ReadOnlyEditableFieldState();
}

class _ReadOnlyEditableFieldState extends State<ReadOnlyEditableField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      enabled: widget.isEditable,
      obscureText: widget.obscureText,
      cursorColor: Colors.black,
      style: AppTextStyles.bold13.copyWith(color: const Color(0xff949d9e)),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        filled: true,
        fillColor: const Color(0xfff9fafa),
        labelText: widget.label,
        labelStyle: AppTextStyles.semiBold13.copyWith(
          color: const Color(0xff949d9e),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xffE6E9EA)),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xffE6E9EA)),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xffE6E9EA)),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            widget.onEditTap();
            widget.focusNode.requestFocus();
          },
          child: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: widget.suffixIcon,
          ),
        ),
      ),
    );
  }
}
