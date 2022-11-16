import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/widgets/custom_back_btn.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.getHeight(35),
      width: SizeUtils.getScreenHeight(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title == "Cart" || title == "Profile"
              ? horizontalSpace(0)
              : const CustomBackButton(
                  color: AppColors.transparent,
                ),
          title == "Cart" || title == "Profile"
              ? horizontalSpace(0)
              : const Spacer(),
          Text(
            title, // title of AppBar
            textAlign: TextAlign.center,
            style: FontUtils.getFont18Style(
                color: AppColors.black, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          appBarButton() // btns in appbar
        ],
      ),
    );
  }

  Widget appBarButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: SizeUtils.getHeight(32),
          width: SizeUtils.getHeight(32),
          child: IconButton(
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: SvgPicture.asset(
                Utils.getAssetSvg("ic_notification"),
                height: SizeUtils.getHeight(24),
                fit: BoxFit.cover,
              )),
        ),
        horizontalSpace(4),
        Container(
          height: SizeUtils.getHeight(16),
          width: SizeUtils.getWidth(2),
          color: AppColors.fontGrey.withOpacity(0.2),
        ),
        horizontalSpace(4),
        SizedBox(
          height: SizeUtils.getHeight(32),
          width: SizeUtils.getHeight(32),
          child: IconButton(
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: SvgPicture.asset(
                Utils.getAssetSvg("ic_search"),
                height: SizeUtils.getHeight(24),
                fit: BoxFit.cover,
              )),
        )
      ],
    );
  }
}
