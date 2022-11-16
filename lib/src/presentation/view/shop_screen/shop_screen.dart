import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/shop_screen/widgets/shop_search_bar.dart';
import 'package:fourkids/src/presentation/view/shop_screen/widgets/shop_sub_category_grid.dart';
import '../../core/theme/custom_sliver_delegate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../sub_category_screen/offer_banner_slider.dart';
import 'widgets/category_list_tab.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: SizeUtils.getHeight(24)),
      height: SizeUtils.getScreenHeight(),
      width: SizeUtils.getScreenWidth(),
      child: ScrollConfiguration(
        behavior: NoGlowScrollBehaviour(),
        child: CustomScrollView(
          primary: true,
          slivers: [
            SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                    minHeight: SizeUtils.getHeight(64),
                    maxHeight: SizeUtils.getHeight(64),
                    child: const ShopSearchBar())),
            SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                    minHeight: SizeUtils.getHeight(40),
                    maxHeight: SizeUtils.getHeight(40),
                    child: const CategoryListTab())),
            SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                    minHeight: SizeUtils.getHeight(0),
                    maxHeight: SizeUtils.getHeight(160),
                    child: const OfferBannerSlider())),
            SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                    minHeight: SizeUtils.getHeight(500),
                    maxHeight: SizeUtils.getHeight(500),
                    child: const ShopSubCategoryGrid()))
            // SliverList(delegate: SliverChildListDelegate([subCategoryGrid()]))
          ],
        ),
      ) /* Column(
        children: [
          verticalSpace(24),
          searchBar(),
          verticalSpace(24),
          const CategoryListTab(),
          verticalSpace(24),
          const OfferBannerSlider(),
          verticalSpace(30),
          subCategoryGrid()
        ],
      ) */
      ,
    );
  }
}
