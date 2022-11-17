

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fourkids/src/presentation/view/product_detail_screen/widgets/page_scroll_indicator.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key});

  @override
  Widget build(BuildContext context) {
     GlobalKey<PageScrollIndicatorState> pageScrollIndicator =
        GlobalKey<PageScrollIndicatorState>();
    return SizedBox(
      height: SizeUtils.getHeight(220),
      width: SizeUtils.getScreenWidth(),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: SizeUtils.getHeight(220),
            width: SizeUtils.getScreenWidth(),
            child: PageView.builder(
                onPageChanged: (value) {
                  pageScrollIndicator.currentState!.changedIndex(value);
                },
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.topCenter,
                    height: SizeUtils.getHeight(220),
                    width: SizeUtils.getHeight(220),
                    child: Image.asset(
                      Utils.getAssetPng("detail_image"),
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                    ),
                  );
                }),
          ),
          // page scroll indicator
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: SizeUtils.getHeight(10)),
                child: PageScrollIndicator(
                  totalCount: 4,
                  key: pageScrollIndicator,
                ),
              )),
          // share button
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(
                  bottom: SizeUtils.getHeight(20),
                  right: SizeUtils.getWidth(24)),
              height: SizeUtils.getHeight(32),
              width: SizeUtils.getHeight(32),
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: AppColors.white,
                    shape: const CircleBorder(),
                    backgroundColor: AppColors.lightBlue),
                child: SvgPicture.asset(Utils.getAssetSvg("ic_share")),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
