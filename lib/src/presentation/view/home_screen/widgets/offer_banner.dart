import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';
import '../../widget/scroll_indicator.dart';

class OfferBanner extends StatefulWidget {
  const OfferBanner({Key? key}) : super(key: key);

  @override
  State<OfferBanner> createState() => _OfferBannerState();
}

class _OfferBannerState extends State<OfferBanner> {
  final GlobalKey<ScrollIndicatorState> _scrollIndicatorKey =
      GlobalKey<ScrollIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
            itemCount: 4,
            itemBuilder: (context, index, realIndex) {
              return Stack(
                children: [
                  bannerImage(),
                  Align(alignment: Alignment.centerLeft, child: bannerText()),
                ],
              );
            },
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  _scrollIndicatorKey.currentState?.changedIndex(index);
                },
                height: SizeUtils.getHeight(230),
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 3),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.vertical)),
        Align(
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: ScrollIndicator(
                totalCount: 4,
                key: _scrollIndicatorKey,
              ),
            ))
      ],
    );
  }

  Widget bannerImage() {
    return Container(
        height: SizeUtils.getHeight(230),
        width: SizeUtils.getScreenWidth(),
        foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              AppColors.black.withOpacity(0.2),
              AppColors.black.withOpacity(0.2)
            ])),
        child: Image.asset(
          Utils.getAssetPng("slider_image"),
          fit: BoxFit.cover,
        ));
  }

  Widget bannerText() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            right: SizeUtils.getWidth(8),
            left: SizeUtils.getWidth(24),
            bottom: SizeUtils.getHeight(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // brand logo
            SizedBox(
                height: SizeUtils.getHeight(30),
                width: SizeUtils.getWidth(70),
                child: Image.asset(
                  Utils.getAssetPng("brand_logo"),
                  fit: BoxFit.contain,
                )),
            // offer text
            verticalSpace(4),
            SizedBox(
              width: SizeUtils.getWidth(165),
              child: Text(
                "Happiness for your little one",
                maxLines: 2,
                style: FontUtils.getFont24Style(
                    color: AppColors.white, fontWeight: FontWeight.w500),
              ),
            ),
            // shop button
            verticalSpace(16),
            shopBtn()
          ],
        ),
      ),
    );
  }
  

  Widget shopBtn() {
    return Container(
      height: SizeUtils.getHeight(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.linearPink1, AppColors.linearPink2])),
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: AppColors.transparent,
            backgroundColor: AppColors.transparent,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(4))),
        onPressed: () {},
        child: Text(
          'Shop Now',
          style: FontUtils.getFont14Style(color: AppColors.white),
        ),
      ),
    );
  }
}
