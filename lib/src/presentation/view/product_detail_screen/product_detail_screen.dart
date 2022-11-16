import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fourkids/src/presentation/view/product_detail_screen/page_scroll_indicator.dart';
import 'package:fourkids/src/presentation/view/product_detail_screen/review_bottom_sheet.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/custom_sliver_delegate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/widgets/custom_back_btn.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/footer_button.dart';
import '../widget/custom_qty_counter.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final GlobalKey<PageScrollIndicatorState> _pageScrollIndicator =
      GlobalKey<PageScrollIndicatorState>();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ScrollConfiguration(
        behavior: NoGlowScrollBehaviour(),
        child: Container(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            padding: EdgeInsets.only(top: SizeUtils.getHeight(24)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Utils.getAssetPng("bg")),
                    fit: BoxFit.cover)),
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                        minHeight: SizeUtils.getHeight(35),
                        maxHeight: SizeUtils.getHeight(35),
                        child: appBar())),
                SliverPersistentHeader(
                    delegate: SliverAppBarDelegate(
                        minHeight: SizeUtils.getHeight(10),
                        maxHeight: SizeUtils.getHeight(220),
                        child: productImages())),
                SliverList(
                    delegate: SliverChildListDelegate([productdetailSheet()]))
              ],
            ) /* Column(
            children: [
            verticalSpace(24),
            appBar(),
            productImages(),
            productdetailSheet(),
          ]), */
            ),
      )),
    );
  }

  Widget ratingBar() {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          ReviewSheet(parentContext: context).show();
        },
        child: Container(
          margin: EdgeInsets.only(right: SizeUtils.getWidth(24)),
          height: SizeUtils.getHeight(40),
          width: SizeUtils.getWidth(100),
          padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(8)),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [AppColors.linearyellow1, AppColors.linearyellow2]),
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
              border: Border.all(
                  color: AppColors.white, width: SizeUtils.getWidth(2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeUtils.getHeight(16),
                width: SizeUtils.getHeight(16),
                child: SvgPicture.asset(
                  Utils.getAssetSvg("ic_rate"),
                  height: SizeUtils.getHeight(16),
                ),
              ),
              horizontalSpace(4),
              Text(
                "4.8 ",
                style: FontUtils.getFont18Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              SizedBox(
                height: SizeUtils.getHeight(16),
                width: SizeUtils.getHeight(16),
                child: SvgPicture.asset(
                  Utils.getAssetSvg("ic_next"),
                  color: AppColors.darkyellow,
                  height: SizeUtils.getHeight(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomBackButton(
            color: AppColors.transparent,
          ),
          // product video
          SizedBox(
            height: SizeUtils.getHeight(24),
            child: TextButton(
              style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(4)),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeUtils.getRadius(15))),
                  backgroundColor: AppColors.white),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.lightBlue),
                    height: SizeUtils.getHeight(16),
                    width: SizeUtils.getHeight(16),
                    child: SvgPicture.asset(
                      Utils.getAssetSvg("ic_play"),
                      height: SizeUtils.getHeight(12),
                    ),
                  ),
                  horizontalSpace(4),
                  Text(
                    "Product Video",
                    style: FontUtils.getFont12Style(
                        color: AppColors.black, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget productImages() {
    return SizedBox(
      height: SizeUtils.getHeight(220),
      width: SizeUtils.getScreenWidth(),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: SizeUtils.getHeight(220),
            width: SizeUtils.getScreenWidth(),
            child: PageView.builder(
                onPageChanged: (value) {
                  _pageScrollIndicator.currentState!.changedIndex(value);
                },
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.topCenter,
                    height: SizeUtils.getHeight(220),
                    width: SizeUtils.getHeight(220),
                    child: Image.asset(
                      Utils.getAssetPng("detail_image"),
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                    ),
                  );
                }),
          ),
          // page scroll indicator
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: SizeUtils.getHeight(10)),
                child: PageScrollIndicator(
                  totalCount: 4,
                  key: _pageScrollIndicator,
                ),
              )),
          // share button
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(
                  bottom: SizeUtils.getHeight(20),
                  right: SizeUtils.getWidth(24)),
              height: SizeUtils.getHeight(32),
              width: SizeUtils.getHeight(32),
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: AppColors.white,
                    shape: const CircleBorder(),
                    backgroundColor: AppColors.lightBlue),
                child: SvgPicture.asset(Utils.getAssetSvg("ic_share")),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget productdetailSheet() {
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
                qtyCounter(),
                verticalSpace(24),
                footerButton(),
                verticalSpace(24),
              ],
            ),
          ),
          ratingBar()
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

  Widget qtyCounter() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(70)),
      height: SizeUtils.getHeight(40),
      // width: SizeUtils.getWidth(150),
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(8), vertical: SizeUtils.getHeight(2)),
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                AppColors.black.withOpacity(0.2),
                AppColors.transparent
              ])),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
        color: AppColors.lightBlue,
      ),
      child: CustomQtyCounter(
        onChange: (value) {
          // value qty
        },
      ),
    );
  }

  /* Widget qtyCounter() {
    return Container(
      height: SizeUtils.getHeight(40),
      // width: SizeUtils.getWidth(100),
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(8), vertical: SizeUtils.getHeight(2)),
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                AppColors.black.withOpacity(0.2),
                AppColors.transparent
              ])),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
        color: AppColors.lightBlue,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: SizeUtils.getHeight(24),
            width: SizeUtils.getHeight(24),
            child: TextButton(
              style: TextButton.styleFrom(
                  primary: AppColors.black,
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeUtils.getRadius(4))),
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColors.white),
              child: Icon(
                Icons.horizontal_rule,
                color: AppColors.fontGrey,
                size: SizeUtils.getHeight(20),
              ),
              onPressed: () {
                setState(() {
                  if (qty > 0) {
                    qty--;
                  }
                });
              },
            ),
          ),
          horizontalSpace(9),
          Text(
            qty < 10 ? "0$qty" : qty.toString(),
            style: FontUtils.getFont16Style(
                color: AppColors.white, fontWeight: FontWeight.w600),
          ),
          horizontalSpace(9),
          SizedBox(
            height: SizeUtils.getHeight(24),
            width: SizeUtils.getHeight(24),
            child: TextButton(
              style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeUtils.getRadius(4))),
                  primary: AppColors.black,
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColors.white),
              child: Icon(
                Icons.add,
                color: AppColors.fontGrey,
                size: SizeUtils.getHeight(20),
              ),
              onPressed: () {
                setState(() {
                  qty++;
                });
              },
            ),
          )
        ],
      ),
    );
  } */

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
        cartBtn()
      ],
    );
  }

  Widget cartBtn() {
    return Container(
      height: SizeUtils.getHeight(56),
      width: SizeUtils.getHeight(56),
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(4), vertical: SizeUtils.getHeight(4)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(18)),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppColors.linearBlack, AppColors.black])),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(16))),
            backgroundColor: AppColors.black),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              Utils.getAssetSvg("ic_shopcart"),
              height: SizeUtils.getHeight(32),
              color: AppColors.white,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                alignment: Alignment.center,
                height: SizeUtils.getHeight(20),
                width: SizeUtils.getHeight(20),
                margin: EdgeInsets.only(top: SizeUtils.getHeight(2)),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: AppColors.black, width: SizeUtils.getWidth(2)),
                    color: AppColors.primaryColor),
                child: Text(
                  "4",
                  textAlign: TextAlign.center,
                  style: FontUtils.getFont8Style(
                      color: AppColors.white, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
        onPressed: () {
          CommonNavigate(parentContext: context).navigateCartScreen();
        },
      ),
    );
  }
}
