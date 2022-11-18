import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/order_detail_screen/widgets/billing_details.dart';
import 'package:fourkids/src/presentation/view/order_detail_screen/widgets/order_list_view.dart';
import 'package:fourkids/src/presentation/view/order_detail_screen/widgets/order_tracking.dart';
import 'package:fourkids/src/presentation/view/order_detail_screen/widgets/product_count.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
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
                  const ProductCount(), // product count and report btn
                  verticalSpace(16),
                  const OrderListView(), // horizontal order listing view
                  verticalSpace(32),
                  const OrderTracking(), // order tracking in horizontal view
                  verticalSpace(40),
                  const BillingDetails(), // billing detais and product detail listing
                  verticalSpace(32)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}
