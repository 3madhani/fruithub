import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/custom_text_form_field.dart';

import '../../../domain/entities/order_entity.dart';

class AddressInputSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const AddressInputSection({super.key, required this.formKey, required this.valueListenable});
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) =>  Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.name = value!;
                },
                hintText: "الاسم كامل",
                keyboardType: TextInputType.name,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.phone = value!;
                },
                hintText: "رقم الهاتف",
                keyboardType: TextInputType.phone,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.email = value!;
                },
                hintText: "البريد الالكتروني",
                keyboardType: TextInputType.emailAddress,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.address = value!;
                },
                hintText: "العنوان",
                keyboardType: TextInputType.streetAddress,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.city = value!;
                },
                hintText: "المدينة",
                keyboardType: TextInputType.text,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.floor =
                      value!;
                },
                hintText: "رقم الطابق , رقم الشقه ..",
                keyboardType: TextInputType.number,
                controller: TextEditingController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
