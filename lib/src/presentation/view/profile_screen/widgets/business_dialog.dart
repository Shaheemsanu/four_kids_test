import 'package:flutter/material.dart';
import '../../../core/constants/common_navigate.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';

class BusinessDialog {
  final BuildContext parentContext;
  BusinessDialog({required this.parentContext});

  show() {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(12))),
      contentPadding: EdgeInsets.symmetric(
          vertical: SizeUtils.getHeight(32),
          horizontal: SizeUtils.getWidth(16)),
      backgroundColor: AppColors.white,
      titlePadding: EdgeInsets.only(
          left: SizeUtils.getWidth(32),
          right: SizeUtils.getWidth(32),
          top: SizeUtils.getHeight(32)),
      title: Text(
        "Are you sure you want to change to Business",
        textAlign: TextAlign.center,
        style: FontUtils.getFont16Style(
            color: AppColors.black, fontWeight: FontWeight.w500),
      ),
      children: [
        Text(
          "By confirming, you are changing your account into Business Account",
          maxLines: 3,
          textAlign: TextAlign.center,
          style: FontUtils.getFont12Style(
              color: AppColors.fontGrey, fontWeight: FontWeight.w400),
        ),
        verticalSpace(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.primaryColor,
                    padding: EdgeInsets.symmetric(
                        vertical: SizeUtils.getHeight(16),
                        horizontal: SizeUtils.getWidth(24))),
                child: Text(
                  "Confirm",
                  style: FontUtils.getFont14Style(
                      color: AppColors.white, fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  CommonNavigate(parentContext: parentContext)
                      .navigateRegisterLocationScreen();
                },
              ),
            ),
            horizontalSpace(16),
            SizedBox(
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeUtils.getHeight(16),
                        horizontal: SizeUtils.getWidth(32))),
                child: Text(
                  "Cancel",
                  style: FontUtils.getFont14Style(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.pop(parentContext);
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
