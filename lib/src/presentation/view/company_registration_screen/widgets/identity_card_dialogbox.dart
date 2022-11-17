import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/common_navigate.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';

class IdentityCardDialogBox extends StatefulWidget {
  const IdentityCardDialogBox({Key? key}) : super(key: key);

  @override
  State<IdentityCardDialogBox> createState() => _IdentityCardDialogBoxState();
}

class _IdentityCardDialogBoxState extends State<IdentityCardDialogBox> {
  int selectedCard = -1;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: EdgeInsets.only(
          right: SizeUtils.getWidth(24),
          left: SizeUtils.getWidth(24),
          top: SizeUtils.getHeight(24)),
      contentPadding: EdgeInsets.only(
          bottom: SizeUtils.getHeight(20),
          left: SizeUtils.getWidth(24),
          right: SizeUtils.getWidth(24),
          top: SizeUtils.getHeight(8)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
      title: Text(
        "Does your Business have GST Number?",
        textAlign: TextAlign.center,
        style: FontUtils.getFont20Style(
            color: AppColors.black, fontWeight: FontWeight.w500),
      ),
      backgroundColor: AppColors.white,
      children: [
        /*  Text(
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem.",
          maxLines: 2,
          style: FontUtils.getFont16Style(color: AppColors.darkGrey, fontWeight: FontWeight.w400),
        ), */
        verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cardSelector("ic_yes", "YES", 0),
            dividerLine(),
            cardSelector("ic_no", "NO", 1)
          ],
        )
      ],
    );
  }

  Widget cardSelector(String svg, String card, int selected) {
    return InkWell(
      focusColor: AppColors.transparent,
      hoverColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      onTap: () {
        Navigator.pop(context);
        setState(() {
          selectedCard = selected;
          if (selected == 0) {
            CommonNavigate(parentContext: context)
                .navigateDocUploadScreen(true);
          } else {
            CommonNavigate(parentContext: context)
                .navigateDocUploadScreen(false);
          }
        });
      },
      child: SizedBox(
        height: SizeUtils.getHeight(108),
        width: SizeUtils.getWidth(80),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: SizeUtils.getHeight(72),
              width: SizeUtils.getHeight(72),
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(20)),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedCard == selected
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withOpacity(0.2)),
              child: SvgPicture.asset(
                Utils.getAssetSvg(svg),
                color: selectedCard == selected
                    ? AppColors.white
                    : AppColors.primaryColor,
                height: SizeUtils.getHeight(32),
              ),
            ),
            verticalSpace(8),
            Text(
              card,
              maxLines: 1,
              style: FontUtils.getFont18Style(color: AppColors.black),
            )
          ],
        ),
      ),
    );
  }

  Widget dividerLine() {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeUtils.getHeight(25)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: SizeUtils.getHeight(1),
            width: SizeUtils.getWidth(20),
            color: AppColors.dividerLine,
          ),
          horizontalSpace(4),
          Text(
            "OR",
            style: FontUtils.getFont14Style(
                color: AppColors.orGrey, fontWeight: FontWeight.w500),
          ),
          horizontalSpace(4),
          Container(
            height: SizeUtils.getHeight(1),
            width: SizeUtils.getWidth(20),
            color: AppColors.dividerLine,
          ),
        ],
      ),
    );
  }
}
