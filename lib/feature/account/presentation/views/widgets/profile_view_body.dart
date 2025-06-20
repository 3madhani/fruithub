import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/core/common/custom_button.dart';
import 'package:fruithub/core/utils/app_assets.dart';
import 'package:fruithub/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'read_only_edit_field.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(text: "احمد ياسر");
  final emailController = TextEditingController(text: "email@gmail.com");
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final currentPasswordFocusNode = FocusNode();
  final newPasswordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  bool isEditableName = true;
  bool isEditableEmail = true;
  bool isVisibleCurrentPassword = false;
  bool isVisibleNewPassword = false;
  bool isVisibleConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text("المعلومات الشخصيه", style: AppTextStyles.semiBold13),
            const SizedBox(height: 10),

            ReadOnlyEditableField(
              label: "الاسم",
              isEditable: isEditableName,
              controller: nameController,
              focusNode: nameFocusNode,
              suffixIcon: SvgPicture.asset(
                isEditableName ? Assets.svgEditProfile : Assets.svgCheck,
                height: 25,
                width: 25,
                color: isEditableName ? null : AppColors.primaryColor,
              ),
              onEditTap: () => setState(() => isEditableName = !isEditableName),
            ),
            const SizedBox(height: 12),

            ReadOnlyEditableField(
              label: "البريد الالكتروني",
              isEditable: isEditableEmail,
              controller: emailController,
              focusNode: emailFocusNode,
              suffixIcon: SvgPicture.asset(
                isEditableEmail ? Assets.svgEditProfile : Assets.svgCheck,
                height: 25,
                width: 25,
                color: isEditableEmail ? null : AppColors.primaryColor,
              ),
              onEditTap:
                  () => setState(() => isEditableEmail = !isEditableEmail),
            ),
            const SizedBox(height: 20),

            const Text("تغيير كلمة المرور", style: AppTextStyles.semiBold13),
            const SizedBox(height: 10),

            ReadOnlyEditableField(
              label: "كلمة المرور الحالية",
              isEditable: false,
              obscureText: !isVisibleCurrentPassword,
              controller: currentPasswordController,
              focusNode: currentPasswordFocusNode,
              suffixIcon: Icon(
                isVisibleCurrentPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: const Color(0xffC9CECF),
              ),
              onEditTap:
                  () => setState(
                    () => isVisibleCurrentPassword = !isVisibleCurrentPassword,
                  ),
            ),
            const SizedBox(height: 12),

            ReadOnlyEditableField(
              label: "كلمة المرور الجديدة",
              isEditable: false,
              obscureText: !isVisibleNewPassword,
              controller: newPasswordController,
              focusNode: newPasswordFocusNode,
              suffixIcon: Icon(
                isVisibleNewPassword ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xffC9CECF),
              ),
              onEditTap:
                  () => setState(
                    () => isVisibleNewPassword = !isVisibleNewPassword,
                  ),
            ),
            const SizedBox(height: 12),

            ReadOnlyEditableField(
              label: "تأكيد كلمة المرور الجديدة",
              isEditable: false,
              obscureText: !isVisibleConfirmPassword,
              controller: confirmPasswordController,
              focusNode: confirmPasswordFocusNode,
              suffixIcon: Icon(
                isVisibleConfirmPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: const Color(0xffC9CECF),
              ),
              onEditTap:
                  () => setState(
                    () => isVisibleConfirmPassword = !isVisibleConfirmPassword,
                  ),
            ),

            const SizedBox(height: 100),
            CustomPrimaryButton(
              title: "حفظ التغييرات",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  debugPrint("Name: ${nameController.text}");
                  debugPrint("Email: ${emailController.text}");
                  debugPrint("New Password: ${newPasswordController.text}");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();

    nameFocusNode.dispose();
    emailFocusNode.dispose();
    currentPasswordFocusNode.dispose();
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    super.dispose();
  }
}
