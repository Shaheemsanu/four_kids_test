import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';


class BillDetailsCart extends StatelessWidget {
  const BillDetailsCart({super.key});

  @override
  Widget build(BuildContext context) {
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Bill Details",
            style: FontUtils.getFont12Style(
                color: AppColors.lightGrey, fontWeight: FontWeight.w400)),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Item Total",
              style: FontUtils.getFont12Style(
                  color: AppColors.metalicBlack, fontWeight: FontWeight.w400),
            ),
            Text(
              "₹890",
              style: FontUtils.getFont14Style(
                  color: AppColors.fontGrey, fontWeight: FontWeight.w500),
            )
          ],
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Coupon Code",
              style: FontUtils.getFont12Style(
                  color: AppColors.metalicBlack, fontWeight: FontWeight.w400),
            ),
            Text(
              "-₹65",
              style: FontUtils.getFont14Style(
                  color: AppColors.primaryColor, fontWeight: FontWeight.w500),
            )
          ],
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Taxes and Charges",
              style: FontUtils.getFont12Style(
                  color: AppColors.metalicBlack, fontWeight: FontWeight.w400),
            ),
            Text(
              "₹25",
              style: FontUtils.getFont14Style(
                  color: AppColors.fontGrey, fontWeight: FontWeight.w500),
            )
          ],
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Discount",
              style: FontUtils.getFont12Style(
                  color: AppColors.metalicBlack, fontWeight: FontWeight.w400),
            ),
            Text(
              "₹150",
              style: FontUtils.getFont14Style(
                  color: AppColors.fontGrey, fontWeight: FontWeight.w500),
            )
          ],
        ),
        verticalSpace(16),
        Container(
          height: SizeUtils.getHeight(2),
          width: SizeUtils.getScreenWidth(),
          color: AppColors.lightGrey.withOpacity(0.2),
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "To Pay",
              style: FontUtils.getFont12Style(
                  color: AppColors.black, fontWeight: FontWeight.w500),
            ),
            Text(
              "₹790",
              style: FontUtils.getFont14Style(
                  color: AppColors.black, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ],
    );;
  }
}