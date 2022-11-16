import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';

class ShopFilter extends StatelessWidget {
  const ShopFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.getHeight(40),
      width: SizeUtils.getHeight(40),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(6))),
          padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(10)),
          backgroundColor: AppColors.white,
        ),
        child: SvgPicture.asset(
          Utils.getAssetSvg("ic_filter"),
          height: SizeUtils.getHeight(24),
        ),
        onPressed: () {},
      ),
    );
  }
}
