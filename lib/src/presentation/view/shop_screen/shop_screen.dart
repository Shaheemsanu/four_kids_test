import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/custom_sliver_delegate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../sub_category_screen/offer_banner_slider.dart';
import 'category_list_tab.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final TextEditingController _searchController = TextEditingController();

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
                    child: searchBar())),
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
                    child: OfferBannerSlider())),
            SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                    minHeight: SizeUtils.getHeight(500),
                    maxHeight: SizeUtils.getHeight(500),
                    child: subCategoryGrid()))
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

  Widget searchBar() {
    return Container(
      color: AppColors.transparent,
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      height: SizeUtils.getHeight(40),
      width: SizeUtils.getScreenWidth(),
      child: Row(
        children: [searchTextField(), horizontalSpace(8), filter()],
      ),
    );
  }

  Widget searchTextField() {
    return Expanded(
      child: TextField(
        controller: _searchController,
        cursorColor: AppColors.black,
        style: FontUtils.getFont14Style(
            color: AppColors.black, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            hintStyle: FontUtils.getFont12Style(
                color: AppColors.fontGrey, fontWeight: FontWeight.w400),
            hintText: "Search products,categories..",
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(8)),
              child: SvgPicture.asset(
                Utils.getAssetSvg("ic_search"),
                height: SizeUtils.getHeight(24),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(12),
                horizontal: SizeUtils.getWidth(12)),
            filled: true,
            fillColor: AppColors.white,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)))),
      ),
    );
  }

  Widget filter() {
    return SizedBox(
      height: SizeUtils.getHeight(40),
      width: SizeUtils.getHeight(40),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(6))),
          padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(10)),
          backgroundColor: AppColors.white,
        ),
        child: SvgPicture.asset(
          Utils.getAssetSvg("ic_filter"),
          height: SizeUtils.getHeight(24),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget subCategoryGrid() {
    return GridView.builder(
        primary: false,
        shrinkWrap: true,
        padding: EdgeInsets.only(
            left: SizeUtils.getWidth(24),
            right: SizeUtils.getWidth(24),
            bottom: SizeUtils.getHeight(100)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: SizeUtils.getHeight(15) / SizeUtils.getWidth(18),
            mainAxisSpacing: SizeUtils.getHeight(8),
            crossAxisSpacing: SizeUtils.getWidth(8)),
        itemCount: 15,
        itemBuilder: (context, index) {
          return subCategoryTile();
        });
  }

  Widget subCategoryTile() {
    return InkWell(
      onTap: () {
        CommonNavigate(parentContext: context).navigateProductListingScreen();
      },
      child: SizedBox(
        height: SizeUtils.getHeight(120),
        width: SizeUtils.getWidth(100),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeUtils.getHeight(10)),
              child: gradientContainer(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeUtils.getHeight(80),
                  width: SizeUtils.getWidth(99),
                  child: Image.asset(
                    Utils.getAssetPng("sub_product"),
                    fit: BoxFit.cover,
                  ),
                ),
                verticalSpace(5),
                Text(
                  "Bicycles",
                  style: FontUtils.getFont14Style(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget gradientContainer() {
    return SizedBox(
        height: SizeUtils.getHeight(40),
        width: SizeUtils.getWidth(100),
        child: Image.asset(
          Utils.getAssetPng("gradient_border"),
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
        ));
  }
}
