import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fourkids/src/presentation/view/product_detail_screen/widgets/review_bottom_sheet.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class ProductRatingBar extends StatelessWidget {
  const ProductRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    {
      return Align(
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () {
            ReviewSheet(parentContext: context).show();
          },
          child: Container(
            margin: EdgeInsets.only(right: SizeUtils.getWidth(24)),
            height: SizeUtils.getHeight(40),
            width: SizeUtils.getWidth(100),
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(8)),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [AppColors.linearyellow1, AppColors.linearyellow2]),
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
                border: Border.all(
                    color: AppColors.white, width: SizeUtils.getWidth(2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeUtils.getHeight(16),
                  width: SizeUtils.getHeight(16),
                  child: SvgPicture.asset(
                    Utils.getAssetSvg("ic_rate"),
                    height: SizeUtils.getHeight(16),
                  ),
                ),
                horizontalSpace(4),
                Text(
                  "4.8 ",
                  style: FontUtils.getFont18Style(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                SizedBox(
                  height: SizeUtils.getHeight(16),
                  width: SizeUtils.getHeight(16),
                  child: SvgPicture.asset(
                    Utils.getAssetSvg("ic_next"),
                    color: AppColors.darkyellow,
                    height: SizeUtils.getHeight(16),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
