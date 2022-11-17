import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/cart_screen/widgets/apply_coupon_cart.dart';
import 'package:fourkids/src/presentation/view/cart_screen/widgets/bill_details_cart.dart';
import 'package:fourkids/src/presentation/view/cart_screen/widgets/cart_footer_button.dart';
import 'package:fourkids/src/presentation/view/cart_screen/widgets/cart_items.dart';
import 'package:fourkids/src/presentation/view/cart_screen/widgets/cart_review_field.dart';
import 'package:fourkids/src/presentation/view/cart_screen/widgets/empy_cart.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../widget/custom_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowScrollBehaviour(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
        height: SizeUtils.getScreenHeight(),
        width: SizeUtils.getScreenWidth(),
        child: Column(
          children: [
            verticalSpace(24),
            const CustomAppBar(title: "Cart"),
            isEmpty ? const Spacer() : verticalSpace(16),
            isEmpty ? verticalSpace(0) : detailTilte(),
            isEmpty ? verticalSpace(0) : verticalSpace(16),
            isEmpty ? const EmptyCart() : cartDetails(),
            isEmpty ? const Spacer() : verticalSpace(0),
          ],
        ),
      ),
    );
  }

  Widget cartDetails() {
    return Expanded(
      child: SingleChildScrollView(
        primary: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // detailTilte(),
            // verticalSpace(24),
            const CartItems(),
            verticalSpace(30),
            const ApplyCoupenCart(),
            verticalSpace(16),
            const CartReviewField(),
            verticalSpace(24),
            const BillDetailsCart(),
            verticalSpace(16),
            const CartFooterButton(),
            verticalSpace(100)
          ],
        ),
      ),
    );
  }

  Widget detailTilte() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total 3 products",
          style: FontUtils.getFont14Style(
              fontWeight: FontWeight.w400, color: AppColors.fontGrey),
        ),
        SizedBox(
          height: SizeUtils.getHeight(24),
          child: TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(12))),
                padding:
                    EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(12)),
                alignment: Alignment.center,
                backgroundColor: AppColors.redColor.withOpacity(0.15)),
            child: Text(
              "Clear All",
              style: FontUtils.getFont12Style(color: AppColors.redColor),
            ),
            onPressed: () {
              setState(() {
                isEmpty = !isEmpty;
              });
            },
          ),
        )
      ],
    );
  }
}
