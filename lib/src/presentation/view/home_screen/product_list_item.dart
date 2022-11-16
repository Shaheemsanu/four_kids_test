import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';

class ProductListItem extends StatelessWidget {
  final double width;
  const ProductListItem({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CommonNavigate(parentContext: context).navigateProductDetailScreen();
      },
      child: Container(
        margin: EdgeInsets.only(right: SizeUtils.getWidth(width)),
        width: SizeUtils.getWidth(130),
        padding: EdgeInsets.only(
          left: SizeUtils.getWidth(12),
        ),
        decoration: BoxDecoration(
            color: AppColors.listTileColor,
            borderRadius: BorderRadius.circular(SizeUtils.getRadius(4))),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(12),
                Center(
                  child: SizedBox(
                    width: SizeUtils.getWidth(90),
                    child: Image.asset(
                      Utils.getAssetPng("product_list"),
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  // product name
                  "Wood Toy",
                  textAlign: TextAlign.left,
                  style: FontUtils.getFont16Style(
                    color: AppColors.black,
                  ),
                ),
                Text(
                  "Min Qty 3",
                  style: FontUtils.getFont10Style(
                      color: AppColors.fontGrey, fontWeight: FontWeight.w400),
                ),
                verticalSpace(8),
                Text(
                  "MRP",
                  style: FontUtils.getFont10Style(
                      color: AppColors.fontGrey, fontWeight: FontWeight.w400),
                ),
                RichText(
                    text: TextSpan(
                        text: "₹860 ",
                        style: FontUtils.getFont12Style(
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.fontGrey,
                            fontWeight: FontWeight.w500),
                        children: [
                      TextSpan(
                          text: "₹790",
                          style: FontUtils.getFont12Style(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500))
                    ])),
                verticalSpace(10)
              ],
            ),
            ratingBar(),
            Align(alignment: Alignment.topRight, child: isoMark())
          ],
        ),
      ),
    );
  }

  Widget ratingBar() {
    return Container(
      margin: EdgeInsets.only(
        top: SizeUtils.getHeight(8),
      ),
      height: SizeUtils.getHeight(20),
      width: SizeUtils.getWidth(45),
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(4)),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [AppColors.linearyellow1, AppColors.linearyellow2]),
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(16)),
          border:
              Border.all(color: AppColors.white, width: SizeUtils.getWidth(2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeUtils.getHeight(8),
            width: SizeUtils.getHeight(8),
            child: SvgPicture.asset(
              Utils.getAssetSvg("ic_rate"),
              height: SizeUtils.getHeight(8),
            ),
          ),
          horizontalSpace(4),
          Text(
            "4.8 ",
            style: FontUtils.getFont10Style(
                color: AppColors.black, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget isoMark() {
    return Container(
      margin: EdgeInsets.only(
          top: SizeUtils.getHeight(8), right: SizeUtils.getWidth(8)),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      height: SizeUtils.getHeight(24),
      width: SizeUtils.getHeight(24),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
      child: SvgPicture.asset(
        Utils.getAssetSvg("isi_mark"),
        height: SizeUtils.getHeight(12),
      ),
    );
  }
}
