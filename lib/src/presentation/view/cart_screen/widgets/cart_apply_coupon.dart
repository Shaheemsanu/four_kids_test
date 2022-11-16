import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';

class CartApplyCoupen extends StatelessWidget {
  const CartApplyCoupen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController applyController = TextEditingController();
    return SizedBox(
      height: SizeUtils.getHeight(40),
      width: SizeUtils.getScreenWidth(),
      child: TextFormField(
        controller: applyController,
        style: FontUtils.getFont14Style(color: AppColors.black),
        cursorColor: AppColors.black,
        decoration: InputDecoration(
            suffix: Text(
              "Apply",
              style: FontUtils.getFont12Style(
                  color: AppColors.lightBlue, fontWeight: FontWeight.w500),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(16)),
            hintStyle: FontUtils.getFont12Style(color: AppColors.fontGrey),
            hintText: "Type Coupon Code",
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(4))),
            fillColor: AppColors.btnGrey,
            filled: true),
      ),
    );
  }
}
