import 'package:flutter/material.dart';
import '../../../core/constants/common_navigate.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RichText(
              text: TextSpan(
                  text: "Oops! ",
                  style: FontUtils.getFont24Style(
                      color: AppColors.redColor, fontWeight: FontWeight.w500),
                  children: [
                TextSpan(
                    text: "you’r cart is empty!",
                    style: FontUtils.getFont24Style(
                        color: AppColors.black, fontWeight: FontWeight.w500)),
              ])),
          verticalSpace(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(40)),
            child: Text(
              "Looks like you haven't added anything to your cart yet.",
              textAlign: TextAlign.center,
              style: FontUtils.getFont16Style(
                  color: AppColors.fontGrey, fontWeight: FontWeight.w400),
            ),
          ),
          verticalSpace(40),
          InkWell(
              onTap: () {
                CommonNavigate(parentContext: context).navigateShopScreen();
              },
              child: Text(
                "Shop Now",
                style: FontUtils.getFont16Style(
                    color: AppColors.lightpink,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline),
              ))
        ],
      ),
    );
  }
}
