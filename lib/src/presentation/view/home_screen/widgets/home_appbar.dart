import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/common_navigate.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: SizeUtils.getWidth(8), top: SizeUtils.getHeight(8)),
      height: SizeUtils.getHeight(50),
      width: SizeUtils.getWidth(102),
      // padding: EdgeInsets.only(left: SizeUtils.getWidth(8)),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Utils.getAssetPng("bar_shape")),
              fit: BoxFit.contain)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          horizontalSpace(16),
          SizedBox(
            height: SizeUtils.getHeight(38),
            width: SizeUtils.getHeight(38),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Utils.getAssetSvg("ic_notification"),
                  height: SizeUtils.getHeight(32),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: SizeUtils.getHeight(16),
            width: SizeUtils.getWidth(2),
            color: AppColors.dividerGrey,
          ),
          SizedBox(
            height: SizeUtils.getHeight(38),
            width: SizeUtils.getHeight(38),
            child: IconButton(
                onPressed: () {
                  CommonNavigate(parentContext: context)
                      .navigateProductListingScreen();
                },
                icon: SvgPicture.asset(
                  Utils.getAssetSvg("ic_search"),
                  height: SizeUtils.getHeight(24),
                  fit: BoxFit.cover,
                )),
          ),
          horizontalSpace(8),
        ],
      ),
    );
  }
}
