import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fourkids/src/presentation/view/cart_screen/qty_counter.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/footer_button.dart';
import '../widget/custom_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController _applyController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  bool isEmpty = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _applyController.dispose();
    _remarkController.dispose();
  }

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
            isEmpty ? emptyCart() : cartDetails(),
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
            cartItems(),
            verticalSpace(30),
            applyCoupon(),
            verticalSpace(16),
            reviewField(),
            verticalSpace(24),
            billDetails(),
            verticalSpace(16),
            footerButton(),
            verticalSpace(100)
          ],
        ),
      ),
    );
  }

  Widget footerButton() {
    return FooterButton(
        label: "Proceed to CheckOut",
        onTap: () {
          CommonNavigate(parentContext: context).navigateSuccessScreen();
        });
  }

  Widget billDetails() {
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
    );
  }

  Widget reviewField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Remarks",
          style: FontUtils.getFont12Style(color: AppColors.black),
        ),
        verticalSpace(8),
        SizedBox(
          height: SizeUtils.getHeight(80),
          width: SizeUtils.getScreenWidth(),
          child: TextFormField(
            maxLines: 8,
            controller: _remarkController,
            style: FontUtils.getFont14Style(color: AppColors.black),
            cursorColor: AppColors.black,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeUtils.getHeight(16),
                    horizontal: SizeUtils.getWidth(16)),
                hintStyle: FontUtils.getFont12Style(color: AppColors.fontGrey),
                hintText: "Type your comments here...",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(4))),
                fillColor: AppColors.btnGrey,
                filled: true),
          ),
        )
      ],
    );
  }

  Widget applyCoupon() {
    return SizedBox(
      height: SizeUtils.getHeight(40),
      width: SizeUtils.getScreenWidth(),
      child: TextFormField(
        controller: _applyController,
        style: FontUtils.getFont14Style(color: AppColors.black),
        cursorColor: AppColors.black,
        decoration: InputDecoration(
            suffix: Text(
              "Apply",
              style: FontUtils.getFont12Style(
                  color: AppColors.lightBlue, fontWeight: FontWeight.w500),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(16)),
            hintStyle: FontUtils.getFont12Style(color: AppColors.fontGrey),
            hintText: "Type Coupon Code",
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(4))),
            fillColor: AppColors.btnGrey,
            filled: true),
      ),
    );
  }

  Widget cartItems() {
    return SizedBox(
        width: SizeUtils.getScreenWidth(),
        child: ListView.builder(
            primary: false,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                height: SizeUtils.getHeight(105),
                width: SizeUtils.getScreenWidth(),
                margin: EdgeInsets.only(bottom: SizeUtils.getHeight(16)),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(4))),
                child: Row(
                  children: [
                    SizedBox(
                      height: SizeUtils.getHeight(100),
                      width: SizeUtils.getHeight(118),
                      child: Image.asset(
                        Utils.getAssetPng("skateboard"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(8),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // product name
                              Text(
                                "Skateboard",
                                style: FontUtils.getFont16Style(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: SizeUtils.getHeight(16),
                                width: SizeUtils.getHeight(16),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero),
                                  child: SvgPicture.asset(
                                    Utils.getAssetSvg("ic_delete"),
                                    height: SizeUtils.getHeight(16),
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                          verticalSpace(4),
                          Text(
                            "Consectetur adipiscing elit, sed...",
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            style: FontUtils.getFont12Style(
                                color: AppColors.fontGrey,
                                fontWeight: FontWeight.w400),
                          ),
                          verticalSpace(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "MRP",
                                    style: FontUtils.getFont10Style(
                                        color: AppColors.fontGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "₹860",
                                        style: FontUtils.getFont12Style(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: AppColors.fontGrey),
                                      ),
                                      horizontalSpace(4),
                                      Text(
                                        "₹760",
                                        style: FontUtils.getFont12Style(
                                            color: AppColors.primaryColor),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              QtyCounter(
                                onChange: (value) {
                                  // qty value
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    horizontalSpace(8)
                  ],
                ),
              );
            }));
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

  Widget emptyCart() {
    return Center(
      child: Column(
        children: [
          RichText(
              text: TextSpan(
                  text: "Oops! ",
                  style: FontUtils.getFont24Style(
                      color: AppColors.redColor, fontWeight: FontWeight.w500),
                  children: [
                TextSpan(
                    text: "you’r cart is empty!",
                    style: FontUtils.getFont24Style(
                        color: AppColors.black, fontWeight: FontWeight.w500)),
              ])),
          verticalSpace(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(40)),
            child: Text(
              "Looks like you haven't added anything to your cart yet.",
              textAlign: TextAlign.center,
              style: FontUtils.getFont16Style(
                  color: AppColors.fontGrey, fontWeight: FontWeight.w400),
            ),
          ),
          verticalSpace(40),
          InkWell(
              onTap: () {
                CommonNavigate(parentContext: context).navigateShopScreen();
              },
              child: Text(
                "Shop Now",
                style: FontUtils.getFont16Style(
                    color: AppColors.lightpink,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline),
              ))
        ],
      ),
    );
  }
}
