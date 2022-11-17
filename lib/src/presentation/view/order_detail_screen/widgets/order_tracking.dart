import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
     List<String> orderTrackTitle = [
    "Order Placed",
    "Shipped",
    "Out for Delivery",
    "Delivered"
  ];
  
  List<String> orderStatusList = [
    "Confirmed 03 Mon, 11.30 AM",
    "Reached Hub on 10 Mon, 04:30PM",
    "Order is out for delivery",
    "Delivered on 12 Wed, 12:30PM "
  ];
   return SizedBox(
      height: SizeUtils.getHeight(122),
      width: SizeUtils.getScreenWidth(),
      child: ListView.builder(
          itemCount: orderTrackTitle.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(
              left: SizeUtils.getWidth(24), right: SizeUtils.getWidth(24)),
          itemBuilder: (context, index) {
            return SizedBox(
              height: SizeUtils.getHeight(120),
              width: SizeUtils.getWidth(190),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderTrackTitle[index], // "Ready to Pickup",
                    style: FontUtils.getFont16Style(
                        color: AppColors.black, fontWeight: FontWeight.w500),
                  ),
                  verticalSpace(4),
                  Text(
                    orderStatusList[index],
                    style: FontUtils.getFont12Style(
                        color: AppColors.iconGrey, fontWeight: FontWeight.w400),
                  ),
                  verticalSpace(16),
                  SizedBox(
                    height: SizeUtils.getHeight(24),
                    width: SizeUtils.getHeight(24),
                    child: SvgPicture.asset(
                      Utils.getAssetSvg("ic_train"),
                      color: AppColors.violetColor,
                    ),
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      horizontalSpace(8),
                      Container(
                        height: SizeUtils.getHeight(10),
                        width: SizeUtils.getHeight(10),
                        decoration: BoxDecoration(
                            color: index == 0
                                ? AppColors.primaryColor
                                : AppColors.fontGrey,
                            shape: BoxShape.circle),
                      ),
                      horizontalSpace(6),
                      if (index != 3)
                        DottedLine(
                          dashColor: AppColors.fontGrey,
                          dashGapColor: AppColors.white,
                          lineLength: /* index == 4 ? SizeUtils.getWidth(160) : */ SizeUtils
                              .getWidth(160),
                        ),
                      /*  index == 4
                              ? Container(
                                  height: SizeUtils.getHeight(10),
                                  width: SizeUtils.getHeight(10),
                                  decoration:
                                      BoxDecoration(color: AppColors.fontGrey, shape: BoxShape.circle),
                                )
                              : verticalSpace(0), */
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}