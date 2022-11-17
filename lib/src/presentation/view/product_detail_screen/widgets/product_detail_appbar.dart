import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';
import '../../../core/widgets/custom_back_btn.dart';

class ProductDetailAppBar extends StatelessWidget {
  const ProductDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomBackButton(
            color: AppColors.transparent,
          ),
          // product video
          SizedBox(
            height: SizeUtils.getHeight(24),
            child: TextButton(
              style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(4)),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeUtils.getRadius(15))),
                  backgroundColor: AppColors.white),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.lightBlue),
                    height: SizeUtils.getHeight(16),
                    width: SizeUtils.getHeight(16),
                    child: SvgPicture.asset(
                      Utils.getAssetSvg("ic_play"),
                      height: SizeUtils.getHeight(12),
                    ),
                  ),
                  horizontalSpace(4),
                  Text(
                    "Product Video",
                    style: FontUtils.getFont12Style(
                        color: AppColors.black, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
