import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/common_navigate.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class HomeCategoryButton extends StatelessWidget {
  const HomeCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CommonNavigate(parentContext: context).navigateCategoryScreen();
        //  Navigate to category screen
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: SizeUtils.getHeight(1),
            width: SizeUtils.getWidth(100),
            color: AppColors.fontGrey.withOpacity(0.5),
          ),
          horizontalSpace(16),
          Text(
            "Shop All Categories",
            style: FontUtils.getFont10Style(
                color: AppColors.black, fontWeight: FontWeight.w500),
          ),
          horizontalSpace(4),
          Container(
            height: SizeUtils.getHeight(16),
            width: SizeUtils.getHeight(16),
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(5)),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.linearPink1, AppColors.linearPink2])),
            child: SvgPicture.asset(
              Utils.getAssetSvg("ic_next"),
              height: SizeUtils.getHeight(6),
            ),
          ),
          horizontalSpace(16),
          Container(
            height: SizeUtils.getHeight(1),
            width: SizeUtils.getWidth(100),
            color: AppColors.fontGrey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
