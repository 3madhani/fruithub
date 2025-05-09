import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

class SocialSignInButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String iconPath;
  const SocialSignInButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xffDDDFDF), width: 1),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(iconPath, width: 22, height: 22),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold16,
          ),
        ),
      ),
    );
  }
}
