import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../home_screen/widgets/product_list_item.dart';
import '../widget/custom_app_bar.dart';
import 'filter_bottom_sheet.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({Key? key}) : super(key: key);

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: Container(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Utils.getAssetPng("bg")),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpace(24),
                const CustomAppBar(title: "Skating"),
                verticalSpace(24),
                filterRow(),
                verticalSpace(8),
                productListingGrid()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget filterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "26 Products",
          style: FontUtils.getFont12Style(
              color: AppColors.fontGrey, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: SizeUtils.getHeight(24),
          width: SizeUtils.getWidth(75),
          child: TextButton(
            style: TextButton.styleFrom(
                foregroundColor: AppColors.black,
                backgroundColor: AppColors.white,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(35)))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeUtils.getHeight(12),
                  width: SizeUtils.getHeight(12),
                  child: SvgPicture.asset(
                    Utils.getAssetSvg("ic_filter"),
                    height: SizeUtils.getHeight(12),
                  ),
                ),
                horizontalSpace(8),
                Text(
                  "Filter",
                  style: FontUtils.getFont12Style(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                )
              ],
            ),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: AppColors.transparent,
                  context: context,
                  builder: (context) {
                    return const FilterBottomSheet();
                  });
              // FilterBottomSheet(parentContext: context).show();
            },
          ),
        )
      ],
    );
  }

  Widget productListingGrid() {
    return Flexible(
        child: GridView.builder(
            padding: EdgeInsets.only(bottom: SizeUtils.getHeight(50)),
            itemCount: 12,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio:
                  SizeUtils.getHeight(15) / SizeUtils.getWidth(18),
              crossAxisSpacing: SizeUtils.getWidth(16),
              mainAxisSpacing: SizeUtils.getHeight(16),
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    CommonNavigate(parentContext: context)
                        .navigateProductDetailScreen();
                  },
                  child: const ProductListItem(width: 0));
            }));
  }
}
