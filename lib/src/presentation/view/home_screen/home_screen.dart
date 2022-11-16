import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/custom_sliver_delegate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../home_screen/product_list_item.dart';
import 'brand_listing_tile.dart';
import 'category_gridview.dart';
import 'offer_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: SizeUtils.getScreenHeight(),
        width: SizeUtils.getScreenWidth(),
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: Stack(
            children: [
              CustomScrollView(slivers: [
                SliverPersistentHeader(
                  floating: false,
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                      minHeight: SizeUtils.getHeight(0),
                      maxHeight: SizeUtils.getHeight(254),
                      child: const OfferBanner()),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 0,
                    maxHeight: SizeUtils.getHeight(85),
                    child: const BrandListingTile(),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  // verticalSpace(24),
                  // const BrandListingTile(),
                  verticalSpace(24),
                  const CategoryGridView(),
                  verticalSpace(8),
                  categoryBtn(),
                  verticalSpace(24),
                  newArrivalListView(),
                  verticalSpace(24),
                  offerImage(),
                  verticalSpace(24),
                  trendingListView(),
                  verticalSpace(100)
                ])),
              ]),
              Align(alignment: Alignment.topRight, child: appBar())
            ],
          ),
        ));
  }

  /* // banner slider (images , text , scroll indicator )
  Widget bannerSlider() {
    return SizedBox(
      height: SizeUtils.getHeight(230),
      width: SizeUtils.getScreenWidth(),
      child: const OfferBanner(),
    );
  } */

  Widget appBar() {
    return Container(
      margin: EdgeInsets.only(
          right: SizeUtils.getWidth(8), top: SizeUtils.getHeight(8)),
      height: SizeUtils.getHeight(50),
      width: SizeUtils.getWidth(102),
      // padding: EdgeInsets.only(left: SizeUtils.getWidth(8)),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Utils.getAssetPng("bar_shape")),
              fit: BoxFit.contain)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          horizontalSpace(16),
          SizedBox(
            height: SizeUtils.getHeight(38),
            width: SizeUtils.getHeight(38),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Utils.getAssetSvg("ic_notification"),
                  height: SizeUtils.getHeight(32),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: SizeUtils.getHeight(16),
            width: SizeUtils.getWidth(2),
            color: AppColors.dividerGrey,
          ),
          SizedBox(
            height: SizeUtils.getHeight(38),
            width: SizeUtils.getHeight(38),
            child: IconButton(
                onPressed: () {
                  CommonNavigate(parentContext: context)
                      .navigateProductListingScreen();
                },
                icon: SvgPicture.asset(
                  Utils.getAssetSvg("ic_search"),
                  height: SizeUtils.getHeight(24),
                  fit: BoxFit.cover,
                )),
          ),
          horizontalSpace(8),
        ],
      ),
    );
  }

  Widget categoryBtn() {
    return InkWell(
      onTap: () {
        CommonNavigate(parentContext: context).navigateCategoryScreen();
        //  Navigate to category screen
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: SizeUtils.getHeight(1),
            width: SizeUtils.getWidth(100),
            color: AppColors.fontGrey.withOpacity(0.5),
          ),
          horizontalSpace(16),
          Text(
            "Shop All Categories",
            style: FontUtils.getFont10Style(
                color: AppColors.black, fontWeight: FontWeight.w500),
          ),
          horizontalSpace(4),
          Container(
            height: SizeUtils.getHeight(16),
            width: SizeUtils.getHeight(16),
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(5)),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.linearPink1, AppColors.linearPink2])),
            child: SvgPicture.asset(
              Utils.getAssetSvg("ic_next"),
              height: SizeUtils.getHeight(6),
            ),
          ),
          horizontalSpace(16),
          Container(
            height: SizeUtils.getHeight(1),
            width: SizeUtils.getWidth(100),
            color: AppColors.fontGrey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget newArrivalListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeUtils.getWidth(24)),
          child: Text(
            "New Arrival Products",
            style: FontUtils.getFont24Style(
                color: AppColors.fontGrey, fontWeight: FontWeight.w500),
          ),
        ),
        verticalSpace(12),
        SizedBox(
          height: SizeUtils.getHeight(187),
          width: SizeUtils.getScreenWidth(),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                  left: SizeUtils.getWidth(24), right: SizeUtils.getWidth(24)),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ProductListItem(width: 8);
              }),
        ),
      ],
    );
  }

  Widget offerImage() {
    return SizedBox(
      height: SizeUtils.getHeight(165),
      width: SizeUtils.getScreenWidth(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // width: SizeUtils.getScreenWidth() / 2,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        AppColors.black.withOpacity(0.4),
                        AppColors.black.withOpacity(0.5)
                      ])),
                  child: Image.asset(
                    Utils.getAssetPng("banner1"),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                offerImageText()
              ],
            ),
          ),
          Expanded(
            /*   height: SizeUtils.getHeight(160),
            width: SizeUtils.getScreenWidth() / 2, */
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.antiAlias,
              children: [
                Container(
                  height: SizeUtils.getHeight(160),
                  width: SizeUtils.getScreenWidth() / 2,
                  // height: SizeUtils.getHeight(150),
                  // width: SizeUtils.getWidth(180),
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      const BoxDecoration(color: AppColors.linearyellow1),
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        AppColors.black.withOpacity(0.1),
                        AppColors.black.withOpacity(0.2)
                      ])),
                  child: Image.asset(
                    Utils.getAssetPng("banner2"),
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                ),
                offerImageText()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget offerImageText() {
    return Padding(
      padding: EdgeInsets.only(
          bottom: SizeUtils.getHeight(16),
          left: SizeUtils.getWidth(16),
          top: SizeUtils.getHeight(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  text: "upto\n",
                  style: FontUtils.getFont12Style(
                      color: AppColors.white, fontWeight: FontWeight.w500),
                  children: [
                TextSpan(
                    text: "25% OFF",
                    style: FontUtils.getFont16Style(
                        color: AppColors.linearyellow2,
                        fontWeight: FontWeight.w500))
              ])),
          verticalSpace(35),
          Text(
            "Best Collections",
            style: FontUtils.getFont16Style(
                color: AppColors.white, fontWeight: FontWeight.w500),
          ),
          verticalSpace(2),
          Text(
            "Smart toys for smart babies",
            style: FontUtils.getFont10Style(
                color: AppColors.white, fontWeight: FontWeight.w400),
          ),
          verticalSpace(4),
          Text(
            "*Terms and conditions apply",
            style: FontUtils.getFont8Style(
                color: AppColors.white, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Widget trendingListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeUtils.getWidth(24)),
          child: Text(
            "Trending Products",
            style: FontUtils.getFont24Style(
                color: AppColors.fontGrey, fontWeight: FontWeight.w500),
          ),
        ),
        verticalSpace(12),
        SizedBox(
          height: SizeUtils.getHeight(187),
          width: SizeUtils.getScreenWidth(),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                  left: SizeUtils.getWidth(24), right: SizeUtils.getWidth(24)),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ProductListItem(
                  width: 8,
                );
              }),
        ),
      ],
    );
  }
}
