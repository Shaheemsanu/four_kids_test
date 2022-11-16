import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/common_navigate.dart';
import '../../../core/theme/scroll_behaviour.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> categoryTitle = [
      "Baby Gear",
      "Toys",
      "New Born",
      "Indoor",
      "Decorations",
      "Footwear",
      "Bags",
      "Apparels"
    ];

    List<String> categoryIcons = [
      "ic_babygear",
      "ic_toys",
      "ic_newborn",
      "ic_indoor",
      "ic_decor",
      "ic_footwear",
      "ic_bags",
      "ic_apparels"
    ];
    return SizedBox(
      child: ScrollConfiguration(
        behavior: NoGlowScrollBehaviour(),
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(12),
                horizontal: SizeUtils.getWidth(24)),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: SizeUtils.getWidth(2),
                mainAxisSpacing: SizeUtils.getHeight(8)),
            itemCount: 8,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  CommonNavigate(parentContext: context)
                      .navigateSubCategoryScreen();
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: SizeUtils.getHeight(74),
                  width: SizeUtils.getWidth(78),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Utils.getAssetPng(
                            index % 2 == 0 ? "grid_shape" : "grid_shape1")),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SizeUtils.getHeight(32),
                        width: SizeUtils.getHeight(32),
                        child: SvgPicture.asset(
                          Utils.getAssetSvg(categoryIcons[index]),
                          height: SizeUtils.getHeight(32),
                        ),
                      ),
                      verticalSpace(8),
                      Text(
                        categoryTitle[index],
                        style: FontUtils.getFont10Style(
                            color: AppColors.fontGrey,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
