import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class ShopSearchTextField extends StatelessWidget {
  const ShopSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Expanded(
      child: TextField(
        controller: searchController,
        cursorColor: AppColors.black,
        style: FontUtils.getFont14Style(
            color: AppColors.black, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            hintStyle: FontUtils.getFont12Style(
                color: AppColors.fontGrey, fontWeight: FontWeight.w400),
            hintText: "Search products,categories..",
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(8)),
              child: SvgPicture.asset(
                Utils.getAssetSvg("ic_search"),
                height: SizeUtils.getHeight(24),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(12),
                horizontal: SizeUtils.getWidth(12)),
            filled: true,
            fillColor: AppColors.white,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)))),
      ),
    );
  }
}
