import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';

class MailImageAdminApproval extends StatelessWidget {
  const MailImageAdminApproval({super.key});

  @override
  Widget build(BuildContext context) {
 return Container(
      clipBehavior: Clip.antiAlias,
      height: SizeUtils.getHeight(104),
      width: SizeUtils.getHeight(104),
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(24),
          vertical: SizeUtils.getHeight(24)),
      decoration:
          const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
      child: Image.asset(
        Utils.getAssetPng("mail"),
        fit: BoxFit.cover,
      ),
    );
  }
}