import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/product_listing_screen/widgets/filter_row.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../home_screen/widgets/product_list_item.dart';
import '../widget/custom_app_bar.dart';

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
                const FliterRow(),
                verticalSpace(8),
                productListingGrid()
              ],
            ),
          ),
        ),
      ),
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
