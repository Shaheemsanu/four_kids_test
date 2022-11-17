import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fourkids/src/presentation/view/product_detail_screen/widgets/prodcut_qty_counter.dart';
import 'package:fourkids/src/presentation/view/product_detail_screen/widgets/product_rating_bar.dart';
import '../../../core/constants/common_navigate.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';
import '../../../core/widgets/footer_button.dart';
import 'cart_button.dart';

class ProductDetailSheet extends StatefulWidget {
  const ProductDetailSheet({super.key});

  @override
  State<ProductDetailSheet> createState() => _ProductDetailSheetState();
}

int selectedColor = -1;
int selectedSize = -1;
// int qty = 0;
List<Color> colors = [
  AppColors.lightpink,
  AppColors.linearGreen,
  AppColors.redColor,
  AppColors.lightBlue
];

List<String> size = ["S", "M", "L", "XL"];

class _ProductDetailSheetState extends State<ProductDetailSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: SizeUtils.getWidth(16),
              right: SizeUtils.getWidth(16),
              top: SizeUtils.getHeight(16),
            ),
            margin: EdgeInsets.only(
                right: SizeUtils.getWidth(8),
                top: SizeUtils.getHeight(18),
                left: SizeUtils.getWidth(8)),
            width: SizeUtils.getScreenWidth(),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(4))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                verticalSpace(12),
                // product title and qty required
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Toy Train",
                      style: FontUtils.getFont24Style(color: AppColors.black),
                    ),
                    SizedBox(
                      width: SizeUtils.getWidth(100),
                      child: Text(
                        "Min Qty 03",
                        textAlign: TextAlign.left,
                        style: FontUtils.getFont14Style(
                            color: AppColors.fontGrey,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                verticalSpace(12),
                // product title and qty required
                // category , price , discount price, sub category
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "GST Applicable",
                          style: FontUtils.getFont12Style(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        verticalSpace(4),
                        Text(
                          "ISI Certified",
                          style: FontUtils.getFont12Style(
                              color: AppColors.fontGrey,
                              fontWeight: FontWeight.w500),
                        ),
                        verticalSpace(16),
                        Text(
                          "Specifications",
                          style: FontUtils.getFont12Style(
                              color: AppColors.lightGrey),
                        ),
                        verticalSpace(8),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Category",
                                  style: FontUtils.getFont12Style(
                                      color: AppColors.darkGrey),
                                ),
                                verticalSpace(2),
                                Text(
                                  "Baby Care",
                                  style: FontUtils.getFont16Style(
                                      color: AppColors.darkGrey),
                                )
                              ],
                            ),
                            horizontalSpace(30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sub Category",
                                  style: FontUtils.getFont12Style(
                                      color: AppColors.darkGrey),
                                ),
                                verticalSpace(2),
                                Text(
                                  "Rideon",
                                  style: FontUtils.getFont16Style(
                                      color: AppColors.darkGrey),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    // price details
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SizeUtils.getRadius(8)),
                          color: AppColors.white,
                          border: Border.all(color: AppColors.lightGrey)),
                      height: SizeUtils.getHeight(110),
                      width: SizeUtils.getWidth(100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Padding(
                            padding:
                                EdgeInsets.only(left: SizeUtils.getWidth(8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "MRP Price",
                                  style: FontUtils.getFont12Style(
                                      color: AppColors.darkGrey),
                                ),
                                Text(
                                  "₹860",
                                  style: FontUtils.getFont16Style(
                                      color: AppColors.darkGrey),
                                )
                              ],
                            ),
                          ),
                          verticalSpace(8),
                          Container(
                            color: AppColors.lightGrey,
                            height: SizeUtils.getHeight(1),
                            width: SizeUtils.getWidth(100),
                          ),
                          verticalSpace(8),
                          Padding(
                            padding:
                                EdgeInsets.only(left: SizeUtils.getWidth(8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "DP",
                                  style: FontUtils.getFont12Style(
                                      color: AppColors.darkGrey),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "₹760",
                                      style: FontUtils.getFont16Style(
                                          color: AppColors.primaryColor),
                                    ),
                                    horizontalSpace(4),
                                    Text(
                                      "₹860",
                                      style: FontUtils.getFont16Style(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: AppColors.lightGrey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                    )
                    // price details
                  ],
                ),
                // category , price , discount price,
                verticalSpace(24),
                descriptionTitle(),
                verticalSpace(24),
                colorSelection(),
                verticalSpace(16),
                sizeSelector(),
                verticalSpace(40),
                // CustomQtyCounter(),
                const ProductQtyCounter(),
                verticalSpace(24),
                footerButton(),
                verticalSpace(24),
              ],
            ),
          ),
          const ProductRatingBar()
        ],
      ),
    );
  }

  Widget descriptionTitle() {
    return Text(
      "Consectetur adipiscing elit, sed do eiusmod teor incididunt ut labore et dolore magn.totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium",
      style: FontUtils.getFont14Style(
          color: AppColors.textGrey, fontWeight: FontWeight.w400),
      maxLines: 10,
    );
  }

  Widget colorSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "COLOR",
          style: FontUtils.getFont16Style(
              color: AppColors.mattBlack, fontWeight: FontWeight.w600),
        ),
        Row(
          children: List.generate(
              4,
              (index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedColor = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: index == 3
                          ? EdgeInsets.zero
                          : EdgeInsets.only(right: SizeUtils.getWidth(16)),
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.getWidth(8)),
                      height: SizeUtils.getHeight(32),
                      width: SizeUtils.getHeight(32),
                      decoration: BoxDecoration(
                          color: colors[index], shape: BoxShape.circle),
                      child: selectedColor == index
                          ? SvgPicture.asset(
                              Utils.getAssetSvg("ic_tick"),
                              height: SizeUtils.getHeight(16),
                            )
                          : verticalSpace(0),
                    ),
                  )),
        )
      ],
    );
  }

  Widget sizeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "SIZE",
          style: FontUtils.getFont16Style(
              color: AppColors.mattBlack, fontWeight: FontWeight.w600),
        ),
        Row(
          children: List.generate(
              4,
              (index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedSize = index;
                      });
                    },
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 250),
                      margin: index == 3
                          ? EdgeInsets.zero
                          : EdgeInsets.only(right: SizeUtils.getWidth(16)),
                      height: SizeUtils.getHeight(32),
                      width: SizeUtils.getHeight(32),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SizeUtils.getRadius(8)),
                          border: Border.all(
                              width: SizeUtils.getWidth(2),
                              color: selectedSize == index
                                  ? AppColors.linearyellow1
                                  : AppColors.sizeBorder),
                          color: selectedSize == index
                              ? AppColors.linearyellow1
                              : AppColors.white,
                          shape: BoxShape.rectangle),
                      child: Text(
                        size[index],
                        maxLines: 1,
                        style: FontUtils.getFont16Style(
                            color: selectedSize == index
                                ? AppColors.mattBlack
                                : AppColors.sizeBorder,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )),
        )
      ],
    );
  }

  Widget footerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FooterButton(
            width: SizeUtils.getWidth(240),
            label: 'Buy Now',
            onTap: () {
              CommonNavigate(parentContext: context).navigateCartScreen();
            }),
        const CartButton()
      ],
    );
  }
}
