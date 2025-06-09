import 'package:flutter/material.dart';
import 'package:fruithub/core/common/custom_text_form_field.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: "الاسم كامل",
            keyboardType: TextInputType.name,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: "رقم الهاتف",
            keyboardType: TextInputType.phone,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: "البريد الالكتروني",
            keyboardType: TextInputType.emailAddress,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: "العنوان",
            keyboardType: TextInputType.streetAddress,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: "المدينة",
            keyboardType: TextInputType.text,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: "رقم الطابق , رقم الشقه ..",
            keyboardType: TextInputType.number,
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
