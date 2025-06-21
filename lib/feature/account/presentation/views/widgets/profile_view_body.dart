import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/custom_button.dart';
import '../../../../../core/common/show_snack_bar.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/update_info/update_info_cubit.dart';
import '../../manager/user_info/user_info_cubit.dart';
import 'read_only_edit_field.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
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
    return BlocListener<UpdateInfoCubit, UpdateInfoState>(
      listener: (context, state) {
        if (state is UpdateUserInfoFailedState) {
          ShowSnackBar.showErrorSnackBar(context, state.message);
        }
        if (state is UpdateUserInfoSuccessState) {
          ShowSnackBar.showSuccessSnackBar(context, state.message);
        }
      },
      child: SingleChildScrollView(
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
                onEditTap:
                    () => setState(() => isEditableName = !isEditableName),
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
                      () =>
                          isVisibleCurrentPassword = !isVisibleCurrentPassword,
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
                  isVisibleNewPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
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
                      () =>
                          isVisibleConfirmPassword = !isVisibleConfirmPassword,
                    ),
              ),

              const SizedBox(height: 100),
              CustomPrimaryButton(
                title: "حفظ التغييرات",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    final newName = nameController.text.trim();
                    final newEmail = emailController.text.trim();
                    final newPassword = newPasswordController.text;
                    final confirmPassword = confirmPasswordController.text;

                    final currentUser = context.read<UserInfoCubit>().userInfo;

                    final isNameChanged = newName != currentUser.name;
                    final isEmailChanged = newEmail != currentUser.email;
                    final isPasswordProvided =
                        newPassword.isNotEmpty && confirmPassword.isNotEmpty;

                    if (isPasswordProvided) {
                      if (newPassword != confirmPassword) {
                        ShowSnackBar.showErrorSnackBar(
                          context,
                          "كلمة المرور غير متطابقة",
                        );
                        return;
                      }
                      context.read<UpdateInfoCubit>().updateUserInfo({
                        "password": newPassword,
                      });
                    }

                    if (isNameChanged || isEmailChanged) {
                      final updateData = <String, dynamic>{};
                      if (isNameChanged) updateData["name"] = newName;
                      if (isEmailChanged) updateData["email"] = newEmail;

                      context.read<UpdateInfoCubit>().updateUserInfo(
                        updateData,
                      );
                    }

                    if (!isNameChanged &&
                        !isEmailChanged &&
                        !isPasswordProvided) {
                      ShowSnackBar.showErrorSnackBar(
                        context,
                        "لم يتم إجراء أي تغييرات.",
                      );
                    }
                  }
                },
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

  @override
  void initState() {
    super.initState();
    final state = context.read<UserInfoCubit>().userInfo;
    nameController = TextEditingController(text: state.name);
    emailController = TextEditingController(text: state.email);
  }
}
