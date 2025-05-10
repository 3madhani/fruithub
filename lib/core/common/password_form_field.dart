import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  final void Function(String?)? onSaved;
  final bool isSignInField;
  final TextEditingController controller;

  const PasswordFormField({super.key, this.onSaved, required this.isSignInField, required this.controller});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      isSignInField: widget.isSignInField,
      onSaved: widget.onSaved,
      hintText: "كلمة المرور",
      keyboardType: TextInputType.visiblePassword,
      isPasswordField: obscureText,
      suffixIcon: GestureDetector(
        onTap: () => setState(() => obscureText = !obscureText),
        child: Icon(
          obscureText ? Icons.remove_red_eye : Icons.visibility_off,
          size: 24,
          color: const Color(0xffC9CECF),
        ),
      ),
    );
  }
}
