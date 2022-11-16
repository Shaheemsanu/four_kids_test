import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../widget/custom_app_bar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Utils.getAssetPng("bg")),
                    fit: BoxFit.cover)),
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpace(24),
                const CustomAppBar(title: "All Categories"),
                // appBar(),
                verticalSpace(24),
                categoryList()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryList() {
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
                      categoryImage()
                    ],
                  ),
                ),
              );
            }));
  }

  Widget categoryImage() {
    return Container(
        clipBehavior: Clip.antiAlias,
        height: SizeUtils.getHeight(110),
        width: SizeUtils.getWidth(100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeUtils.getRadius(40)),
                topLeft: Radius.circular(SizeUtils.getRadius(40)))),
        child: Image.asset(
          Utils.getAssetPng("category_image"),
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ));
  }
}
