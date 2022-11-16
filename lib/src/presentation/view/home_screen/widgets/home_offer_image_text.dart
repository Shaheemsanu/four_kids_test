import 'package:flutter/cupertino.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class HomeOfferImageText extends StatelessWidget {
  const HomeOfferImageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: SizeUtils.getHeight(16),
          left: SizeUtils.getWidth(16),
          top: SizeUtils.getHeight(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  text: "upto\n",
                  style: FontUtils.getFont12Style(
                      color: AppColors.white, fontWeight: FontWeight.w500),
                  children: [
                TextSpan(
                    text: "25% OFF",
                    style: FontUtils.getFont16Style(
                        color: AppColors.linearyellow2,
                        fontWeight: FontWeight.w500))
              ])),
          verticalSpace(35),
          Text(
            "Best Collections",
            style: FontUtils.getFont16Style(
                color: AppColors.white, fontWeight: FontWeight.w500),
          ),
          verticalSpace(2),
          Text(
            "Smart toys for smart babies",
            style: FontUtils.getFont10Style(
                color: AppColors.white, fontWeight: FontWeight.w400),
          ),
          verticalSpace(4),
          Text(
            "*Terms and conditions apply",
            style: FontUtils.getFont8Style(
                color: AppColors.white, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
