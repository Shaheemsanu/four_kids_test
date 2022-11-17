import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fourkids/src/presentation/view/order_detail_screen/widgets/report_dialog_box.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class ProductCount extends StatelessWidget {
  const ProductCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "4 Products - ₹790",
            style: FontUtils.getFont16Style(
                fontWeight: FontWeight.w500, color: AppColors.black),
          ),
          SizedBox(
            height: SizeUtils.getHeight(24),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: AppColors.black,
                  alignment: Alignment.center,
                  padding: EdgeInsets.zero),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Utils.getAssetSvg("ic_report"),
                    height: SizeUtils.getHeight(16),
                  ),
                  horizontalSpace(4),
                  Text(
                    "Report",
                    style: FontUtils.getFont14Style(color: AppColors.redColor),
                  )
                ],
              ),
              onPressed: () {
                ReportDialog(parentContext: context).show();
              },
            ),
          )
        ],
      ),
    );
  }
}
