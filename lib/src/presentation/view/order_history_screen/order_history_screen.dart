import 'package:flutter/material.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../widget/custom_app_bar.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Utils.getAssetPng("bg")),
                    fit: BoxFit.cover)),
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            padding: EdgeInsets.only(
                left: SizeUtils.getWidth(24),
                right: SizeUtils.getWidth(24),
                top: SizeUtils.getHeight(24)),
            child: Column(
              children: [
                const CustomAppBar(title: "Orders"),
                verticalSpace(24),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 12,
                        padding:
                            EdgeInsets.only(bottom: SizeUtils.getHeight(48)),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              CommonNavigate(parentContext: context)
                                  .navigateOrderDetailScreen();
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: SizeUtils.getHeight(16)),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(
                                      SizeUtils.getRadius(4))),
                              width: SizeUtils.getScreenWidth(),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: SizeUtils.getHeight(100),
                                    width: SizeUtils.getWidth(115),
                                    child: Image.asset(
                                      Utils.getAssetPng("skateboard"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: SizeUtils.getWidth(8),
                                        vertical: SizeUtils.getHeight(8)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            // Order ID
                                            Text(
                                              "#002949",
                                              style: FontUtils.getFont16Style(
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            index == 3
                                                ? status("Pending")
                                                : index % 2 == 0
                                                    ? status("Delivered")
                                                    : status("Ongoing")
                                          ],
                                        ),
                                        verticalSpace(4),
                                        // date and time of order
                                        Text(
                                          "02 Mon - 11:30 AM",
                                          style: FontUtils.getFont12Style(
                                              color: AppColors.textGrey,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        verticalSpace(16),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "MRP",
                                                  style:
                                                      FontUtils.getFont10Style(
                                                          color: AppColors
                                                              .fontGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                                RichText(
                                                    text: TextSpan(
                                                        text: "₹860 ",
                                                        style: FontUtils
                                                            .getFont12Style(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                color: AppColors
                                                                    .fontGrey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                        children: [
                                                      TextSpan(
                                                          text: "₹790",
                                                          style: FontUtils
                                                              .getFont12Style(
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500))
                                                    ])),
                                              ],
                                            ),
                                            horizontalSpace(24),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Qty",
                                                  style:
                                                      FontUtils.getFont10Style(
                                                          color: AppColors
                                                              .fontGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                                Text(
                                                  "03",
                                                  style:
                                                      FontUtils.getFont12Style(
                                                          color: AppColors
                                                              .fontGrey,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                )
                                              ],
                                            ),
                                            horizontalSpace(24),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Size",
                                                  style:
                                                      FontUtils.getFont10Style(
                                                          color: AppColors
                                                              .fontGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                                Text(
                                                  "Medium",
                                                  style:
                                                      FontUtils.getFont12Style(
                                                          color: AppColors
                                                              .fontGrey,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget status(String stats) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(8), vertical: SizeUtils.getHeight(3)),
      decoration: BoxDecoration(
          color: getStatusColor(stats),
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(16))),
      child: Text(
        stats,
        style: FontUtils.getFont10Style(
            color: stats == "Pending" ? AppColors.black : AppColors.white,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Color getStatusColor(String stats) {
    Color statusColor = AppColors.linearyellow1;
    switch (stats) {
      case "Ongoing":
        {
          statusColor = AppColors.lightBlue;
        }
        break;

      case "Delivered":
        {
          statusColor = AppColors.primaryColor;
        }
        break;
    }
    return statusColor;
    /*   Color statusColor = AppColors.linearyellow1;
    if (stats == "Ongoing") {
      statusColor = AppColors.lightBlue;
    } else if (stats == "Delivered") {
      statusColor = AppColors.primaryColor;
    }
    return statusColor; */
  }
}
