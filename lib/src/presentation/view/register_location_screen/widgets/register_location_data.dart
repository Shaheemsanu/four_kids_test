import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class RegisterLoctionData extends StatelessWidget {
  const RegisterLoctionData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: SizeUtils.getHeight(180),
      width: SizeUtils.getScreenWidth(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: SizeUtils.getHeight(104),
            width: SizeUtils.getHeight(104),
            padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.getWidth(24),
                vertical: SizeUtils.getHeight(24)),
            decoration: const BoxDecoration(
                color: AppColors.white, shape: BoxShape.circle),
            child: Image.asset(Utils.getAssetPng("location_image")),
          ),
          verticalSpace(16),
          Text(
            "Your Current ocation",
            style: FontUtils.getFont16Style(
                color: AppColors.fontGrey, fontWeight: FontWeight.w500),
          ),
          verticalSpace(9),
          SizedBox(
            width: SizeUtils.getWidth(222),
            child: Text(
              "Karimbully, Mele Pattambi...",
              maxLines: 1,
              style: FontUtils.getFont18Style(
                  color: AppColors.black, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    ));
  }
}
