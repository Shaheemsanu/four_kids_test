import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';

class GreetingTextAdminApproval extends StatelessWidget {
  const GreetingTextAdminApproval({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(36)),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "Great! ",
              style: FontUtils.getFont20Style(
                  color: AppColors.lightpink, fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                    text: "Your Acccount\nRequested Succefully Submited.",
                    style: FontUtils.getFont20Style(
                        color: AppColors.black, fontWeight: FontWeight.w500))
              ])),
    );
  }
}
