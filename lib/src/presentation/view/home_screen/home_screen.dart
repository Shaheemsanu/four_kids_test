import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/home_screen/widgets/home_appbar.dart';
import 'package:fourkids/src/presentation/view/home_screen/widgets/home_category_button.dart';
import 'package:fourkids/src/presentation/view/home_screen/widgets/home_new_arrival_list_view.dart';
import 'package:fourkids/src/presentation/view/home_screen/widgets/home_offer_image.dart';
import 'package:fourkids/src/presentation/view/home_screen/widgets/offer_banner.dart';
import 'package:fourkids/src/presentation/view/home_screen/widgets/home_trending_list_view.dart';
import '../../core/theme/custom_sliver_delegate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import 'widgets/brand_listing_tile.dart';
import 'widgets/category_gridview.dart';

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
                  const HomeCategoryButton(),
                  verticalSpace(24),
                  const HomeNewArrivalListView(),
                  verticalSpace(24),
                  const HomeOfferImage(),
                  verticalSpace(24),
                  const HomeTrendingListView(),
                  verticalSpace(100)
                ])),
              ]),
              const Align(alignment: Alignment.topRight, child: HomeAppBar())
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

}


/*   Widget trendingListView() {
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
  } */

