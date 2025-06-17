import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/custom_text_form_field.dart';
import '../../../domain/entities/order_input_entity.dart';

class AddressInputSection extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  const AddressInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });

  @override
  State<AddressInputSection> createState() => _AddressInputSectionState();
}

class _AddressInputSectionState extends State<AddressInputSection> {
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;
  late final TextEditingController addressController;
  late final TextEditingController cityController;
  late final TextEditingController floorController;

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderInputEntity>(context, listen: false);
    final shipping = order.shippingAddress;

    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: widget.valueListenable,
        builder:
            (context, autoValidate, _) => Form(
              key: widget.formKey,
              autovalidateMode: autoValidate,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    controller: nameController,
                    hintText: "الاسم كامل",
                    keyboardType: TextInputType.name,
                    onSaved: (value) => shipping.name = value!,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: phoneController,
                    hintText: "رقم الهاتف",
                    keyboardType: TextInputType.phone,
                    onSaved: (value) => shipping.phone = value!,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: "البريد الالكتروني",
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => shipping.email = value!,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: addressController,
                    hintText: "العنوان",
                    keyboardType: TextInputType.streetAddress,
                    onSaved: (value) => shipping.address = value!,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: cityController,
                    hintText: "المدينة",
                    keyboardType: TextInputType.text,
                    onSaved: (value) => shipping.city = value!,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: floorController,
                    hintText: "رقم الطابق , رقم الشقه ..",
                    keyboardType: TextInputType.number,
                    onSaved: (value) => shipping.floor = value!,
                  ),
                ],
              ),
            ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    floorController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final order = Provider.of<OrderInputEntity>(context, listen: false);
    final shipping = order.shippingAddress;

    nameController = TextEditingController(text: shipping.name);
    phoneController = TextEditingController(text: shipping.phone);
    emailController = TextEditingController(text: shipping.email);
    addressController = TextEditingController(text: shipping.address);
    cityController = TextEditingController(text: shipping.city);
    floorController = TextEditingController(text: shipping.floor);
  }
}
