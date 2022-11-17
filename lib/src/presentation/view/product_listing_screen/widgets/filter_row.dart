import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';
import 'filter_bottom_sheet.dart';

class FliterRow extends StatelessWidget {
  const FliterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "26 Products",
          style: FontUtils.getFont12Style(
              color: AppColors.fontGrey, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: SizeUtils.getHeight(24),
          width: SizeUtils.getWidth(75),
          child: TextButton(
            style: TextButton.styleFrom(
                foregroundColor: AppColors.black,
                backgroundColor: AppColors.white,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(35)))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeUtils.getHeight(12),
                  width: SizeUtils.getHeight(12),
                  child: SvgPicture.asset(
                    Utils.getAssetSvg("ic_filter"),
                    height: SizeUtils.getHeight(12),
                  ),
                ),
                horizontalSpace(8),
                Text(
                  "Filter",
                  style: FontUtils.getFont12Style(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                )
              ],
            ),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: AppColors.transparent,
                  context: context,
                  builder: (context) {
                    return const FilterBottomSheet();
                  });
              // FilterBottomSheet(parentContext: context).show();
            },
          ),
        )
      ],
    );
  }
}
