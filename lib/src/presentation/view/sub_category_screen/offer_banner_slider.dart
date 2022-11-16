import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';

class OfferBannerSlider extends StatefulWidget {
  const OfferBannerSlider({Key? key}) : super(key: key);

  @override
  State<OfferBannerSlider> createState() => _OfferBannerSliderState();
}

class _OfferBannerSliderState extends State<OfferBannerSlider> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: SizeUtils.getHeight(154),
        width: SizeUtils.getScreenWidth(),
        child: CarouselSlider.builder(
            itemCount: 4,
            itemBuilder: (context, index, realIndex) {
              return slideTile();
            },
            options: CarouselOptions(
                onPageChanged: (index, reason) {},
                height: SizeUtils.getHeight(130),
                viewportFraction: 0.85,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 3),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal)),
      ),
    );
  }

  Widget slideTile() {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: SizeUtils.getHeight(130),
      width: SizeUtils.getScreenWidth(),
      margin: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(8)),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
      child: Row(
        children: [
          horizontalSpace(16),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              Text(
                "Tricycles",
                style: FontUtils.getFont24Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              priceOfferText(),
              const Spacer(),
              Container(
                height: SizeUtils.getHeight(1),
                width: SizeUtils.getWidth(60),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [AppColors.dividerGrey, AppColors.white])),
              ),
              const Spacer(),
              Text(
                "*TERMS & CONDITIONS WILL APPLY",
                style: FontUtils.getFont8Style(color: AppColors.redColor),
              ),
              verticalSpace(12)
            ],
          ),
          const Spacer(),
          SizedBox(
              height: SizeUtils.getHeight(130),
              width: SizeUtils.getWidth(120),
              child: Image.asset(
                Utils.getAssetPng("slide_product"),
                fit: BoxFit.cover,
              ))
        ],
      ),
    );
  }

  Widget priceOfferText() {
    return RichText(
        text: TextSpan(
            text: "₹549",
            style: FontUtils.getFont18Style(
                color: AppColors.primaryColor, fontWeight: FontWeight.w500),
            children: [
          TextSpan(
            text: "/Starts From\n",
            style: FontUtils.getFont10Style(
                color: AppColors.primaryColor, fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: "on your first checkout",
            style: FontUtils.getFont12Style(
                color: AppColors.black, fontWeight: FontWeight.w400),
          )
        ]));
  }
}
