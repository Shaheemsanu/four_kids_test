import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fourkids/src/presentation/view/category_screen/widgets/category_image.dart';
import 'package:fourkids/src/presentation/view/category_screen/widgets/category_list.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../widget/custom_app_bar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Utils.getAssetPng("bg")),
                    fit: BoxFit.cover)),
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpace(24),
                const CustomAppBar(title: "All Categories"),
                // appBar(),
                verticalSpace(24),
                const CategoryList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
