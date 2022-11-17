import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class BillingDetails extends StatelessWidget {
  const BillingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bill Details",
            style: FontUtils.getFont12Style(
                color: AppColors.fontGrey, fontWeight: FontWeight.w400),
          ),
          verticalSpace(16),
          productListView(),
          verticalSpace(16),
          const Divider(
            color: AppColors.lightGrey,
          ),
          verticalSpace(16),
          billRow("Item Total", "₹890"),
          verticalSpace(16),
          billRow("Coupon Code", "₹65"),
          verticalSpace(16),
          billRow("Taxes and Charges", "₹25"),
          verticalSpace(16),
          billRow("Discount", "₹25"),
          verticalSpace(16),
          const Divider(
            color: AppColors.lightGrey,
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "To Pay",
                style: FontUtils.getFont12Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                "₹790",
                style: FontUtils.getFont12Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget productListView() {
    return SizedBox(
        child: ListView.builder(
            primary: false,
            itemCount: 12,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: index == 11
                    ? EdgeInsets.zero
                    : EdgeInsets.only(bottom: SizeUtils.getHeight(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Skaeteboard  x3",
                      style: FontUtils.getFont12Style(
                          color: AppColors.black, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "₹2900",
                      style: FontUtils.getFont12Style(
                          color: AppColors.fontGrey,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              );
            }));
  }

  Widget billRow(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: FontUtils.getFont12Style(
              color: AppColors.black, fontWeight: FontWeight.w400),
        ),
        Text(
          title == "Coupon Code" ? "-$price" : price,
          style: FontUtils.getFont12Style(
              color: title == "Coupon Code"
                  ? AppColors.primaryColor
                  : AppColors.fontGrey,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
