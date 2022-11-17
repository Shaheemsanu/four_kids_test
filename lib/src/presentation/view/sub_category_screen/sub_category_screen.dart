import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/sub_category_screen/widgets/sub_category_grid.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../widget/custom_app_bar.dart';
import 'widgets/offer_banner_slider.dart';

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
                const SubCategoryGrid()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
