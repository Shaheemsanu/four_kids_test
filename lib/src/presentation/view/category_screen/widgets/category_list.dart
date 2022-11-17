import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/common_navigate.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';
import 'category_image.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

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
    return Expanded(
        child: ListView.builder(
            itemCount: categoryIcons.length,
            padding: EdgeInsets.only(bottom: SizeUtils.getHeight(28)),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  CommonNavigate(parentContext: context)
                      .navigateSubCategoryScreen();
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: SizeUtils.getHeight(110),
                  width: SizeUtils.getScreenWidth(),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeUtils.getRadius(4)),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: SizeUtils.getRadius(8),
                            color: AppColors.black.withOpacity(0.1))
                      ]),
                  margin: EdgeInsets.only(bottom: SizeUtils.getHeight(16)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeUtils.getWidth(16),
                            bottom: SizeUtils.getHeight(16)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Utils.getAssetSvg(categoryIcons[index]),
                                  height: SizeUtils.getHeight(32),
                                ),
                                horizontalSpace(8),
                                Text(
                                  categoryTitle[index],
                                  style: FontUtils.getFont16Style(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            verticalSpace(18),
                            SizedBox(
                              width: SizeUtils.getWidth(175),
                              child: Text(
                                "Bicycles, Tricyles, Rechargeable,\nWalker, Twister, Rideon...",
                                maxLines: 2,
                                style: FontUtils.getFont12Style(
                                    color: AppColors.fontGrey,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      const CategoryImage()
                    ],
                  ),
                ),
              );
            }));
  }
}
