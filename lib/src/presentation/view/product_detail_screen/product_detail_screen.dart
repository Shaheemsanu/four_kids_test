import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fourkids/src/presentation/view/product_detail_screen/widgets/page_scroll_indicator.dart';
import 'package:fourkids/src/presentation/view/product_detail_screen/widgets/product_detail_appbar.dart';
import 'package:fourkids/src/presentation/view/product_detail_screen/widgets/product_detail_sheet.dart';
import 'package:fourkids/src/presentation/view/product_detail_screen/widgets/product_images.dart';
import 'package:fourkids/src/presentation/view/product_detail_screen/widgets/review_bottom_sheet.dart';
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
                        child: const ProductDetailAppBar())),
                SliverPersistentHeader(
                    delegate: SliverAppBarDelegate(
                        minHeight: SizeUtils.getHeight(10),
                        maxHeight: SizeUtils.getHeight(220),
                        child: const ProductImages())),
                SliverList(
                    delegate:
                        SliverChildListDelegate([const ProductDetailSheet()]))
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
}
