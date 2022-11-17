import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/product_listing_screen/widgets/filter_row.dart';
import 'package:fourkids/src/presentation/view/product_listing_screen/widgets/product_listing_grid.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
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
                const ProductListingGrid()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
