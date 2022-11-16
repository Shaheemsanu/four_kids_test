import 'package:flutter/material.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../widget/custom_app_bar.dart';
import 'offer_banner_slider.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Utils.getAssetPng("bg")),
                  fit: BoxFit.cover)),
          child: ScrollConfiguration(
            behavior: NoGlowScrollBehaviour(),
            child: /* CustomScrollView(
              primary: true,
              slivers: [
                SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                        minHeight: 100,
                        maxHeight: 100,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeUtils.getWidth(24)),
                          child: const CustomAppBar(title: "Baby Gear"),
                        ))),
                SliverPersistentHeader(
                    delegate: SliverAppBarDelegate(
                        maxHeight: 200,
                        minHeight: 0,
                        child: const OfferBannerSlider())),
                SliverList(
                    delegate: SliverChildListDelegate([subCategoryGrid()]))
              ],
            ) */
                Column(
              children: [
                verticalSpace(16),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
                  child: const CustomAppBar(title: "Baby Gear"),
                ),
                // verticalSpace(24),
                const OfferBannerSlider(),
                // verticalSpace(24),
                subCategoryGrid()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget subCategoryGrid() {
    return Flexible(
      child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
              vertical: SizeUtils.getHeight(16),
              horizontal: SizeUtils.getWidth(24)),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio:
                  SizeUtils.getHeight(15) / SizeUtils.getWidth(18),
              mainAxisSpacing: SizeUtils.getHeight(8),
              crossAxisSpacing: SizeUtils.getWidth(8)),
          itemCount: 30,
          itemBuilder: (context, index) {
            return subCategoryTile();
          }),
    );
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
