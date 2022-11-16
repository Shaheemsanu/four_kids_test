import 'package:flutter/material.dart';
import '../../../core/constants/common_navigate.dart';
import '../../../core/theme/scroll_behaviour.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';

class BrandListingTile extends StatelessWidget {
  const BrandListingTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> brands = [
      "brand1",
      "brand2",
      "brand3",
      "brand4",
      "brand5",
      "brand1",
      "brand2",
      "brand3",
      "brand4",
      "brand5"
    ];
    return SizedBox(
      height: SizeUtils.getHeight(85),
      width: SizeUtils.getScreenWidth(),
      child: Stack(
        children: [
          SizedBox(
            width: SizeUtils.getScreenWidth(),
            child: Text(
              "TOP BRANDS",
              textAlign: TextAlign.center,
              style: FontUtils.getFont24Style(
                  color: AppColors.black.withOpacity(0.2)),
            ),
          ),
          // brand listview
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(8)),
              height: SizeUtils.getHeight(65),
              width: SizeUtils.getScreenWidth(),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: SizeUtils.getRadius(4),
                        blurRadius: SizeUtils.getRadius(35),
                        color: AppColors.black.withOpacity(0.1))
                  ],
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(4))),
              child: ScrollConfiguration(
                behavior: NoGlowScrollBehaviour(),
                child: ListView.builder(
                    itemCount: brands.length,
                    padding:
                        EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(5)),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          CommonNavigate(parentContext: context)
                              .navigateProductListingScreen();
                        },
                        child: SizedBox(
                          height: SizeUtils.getHeight(50),
                          width: SizeUtils.getWidth(67),
                          child: Image.asset(
                            Utils.getAssetPng(brands[index]),
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
