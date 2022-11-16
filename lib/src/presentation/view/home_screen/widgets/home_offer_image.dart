import 'package:flutter/cupertino.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';
import 'home_offer_image_text.dart';

class HomeOfferImage extends StatelessWidget {
  const HomeOfferImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.getHeight(165),
      width: SizeUtils.getScreenWidth(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // width: SizeUtils.getScreenWidth() / 2,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        AppColors.black.withOpacity(0.4),
                        AppColors.black.withOpacity(0.5)
                      ])),
                  child: Image.asset(
                    Utils.getAssetPng("banner1"),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                const HomeOfferImageText()
              ],
            ),
          ),
          Expanded(
            /*   height: SizeUtils.getHeight(160),
            width: SizeUtils.getScreenWidth() / 2, */
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.antiAlias,
              children: [
                Container(
                  height: SizeUtils.getHeight(160),
                  width: SizeUtils.getScreenWidth() / 2,
                  // height: SizeUtils.getHeight(150),
                  // width: SizeUtils.getWidth(180),
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      const BoxDecoration(color: AppColors.linearyellow1),
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        AppColors.black.withOpacity(0.1),
                        AppColors.black.withOpacity(0.2)
                      ])),
                  child: Image.asset(
                    Utils.getAssetPng("banner2"),
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                ),
                const HomeOfferImageText()
              ],
            ),
          )
        ],
      ),
    );
  }
}
