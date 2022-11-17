import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/common_navigate.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeUtils.getHeight(56),
      width: SizeUtils.getHeight(56),
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(4), vertical: SizeUtils.getHeight(4)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(18)),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppColors.linearBlack, AppColors.black])),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(16))),
            backgroundColor: AppColors.black),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              Utils.getAssetSvg("ic_shopcart"),
              height: SizeUtils.getHeight(32),
              color: AppColors.white,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                alignment: Alignment.center,
                height: SizeUtils.getHeight(20),
                width: SizeUtils.getHeight(20),
                margin: EdgeInsets.only(top: SizeUtils.getHeight(2)),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: AppColors.black, width: SizeUtils.getWidth(2)),
                    color: AppColors.primaryColor),
                child: Text(
                  "4",
                  textAlign: TextAlign.center,
                  style: FontUtils.getFont8Style(
                      color: AppColors.white, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
        onPressed: () {
          CommonNavigate(parentContext: context).navigateCartScreen();
        },
      ),
    );
  }
}
