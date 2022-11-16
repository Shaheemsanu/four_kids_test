import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fourkids/src/presentation/view/order_detail_screen/report_dialog_box.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../home_screen/widgets/product_list_item.dart';
import '../widget/custom_app_bar.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
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

  List<String> orderIcons = [
    "ic_placed",
    "ic_shipped",
    "ic_out",
    "ic_delivered"
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: Container(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Utils.getAssetPng("bg")),
                    fit: BoxFit.cover)),
            padding: EdgeInsets.only(top: SizeUtils.getHeight(24)),
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeUtils.getWidth(24)),
                    child: const CustomAppBar(title: "Order #002949"),
                  ),
                  verticalSpace(32),
                  productCount(), // product count and report btn
                  verticalSpace(16),
                  orderListView(), // horizontal order listing view
                  verticalSpace(32),
                  orderTracking(), // order tracking in horizontal view
                  verticalSpace(40),
                  billingDetails(), // billing detais and product detail listing
                  verticalSpace(32)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget billingDetails() {
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

  Widget orderTracking() {
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

  Widget orderListView() {
    return SizedBox(
        width: SizeUtils.getScreenWidth(),
        height: SizeUtils.getHeight(187),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: SizeUtils.getWidth(24)),
            itemCount: 12,
            itemBuilder: (context, index) {
              return const ProductListItem(width: 16);
            }));
  }

  Widget productCount() {
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
