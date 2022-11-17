import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';

class SelectModeDialog extends StatefulWidget {
  final Function(ImageSource) onSelect;
  const SelectModeDialog({Key? key, required this.onSelect}) : super(key: key);

  @override
  State<SelectModeDialog> createState() => _SelectModeDialogState();
}

class _SelectModeDialogState extends State<SelectModeDialog> {
  int selectedCard = -1;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: EdgeInsets.only(
          left: SizeUtils.getWidth(24), top: SizeUtils.getHeight(24)),
      title: Text(
        "Choose",
        style: FontUtils.getFont24Style(
            color: AppColors.black, fontWeight: FontWeight.w500),
      ),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
      contentPadding: EdgeInsets.symmetric(
          vertical: SizeUtils.getHeight(24),
          horizontal: SizeUtils.getWidth(24)),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cardSelector("ic_camera", "Camera", 0),
            dividerLine(),
            cardSelector("ic_gallery", "Gallery", 1)
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
        setState(() {
          selectedCard = selected;
          if (selectedCard == 0) {
            widget.onSelect(ImageSource.camera);
          } else {
            widget.onSelect(ImageSource.gallery);
          }
        });
        Navigator.pop(context);
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
                      ? AppColors.violetColor
                      : AppColors.violetColor.withOpacity(0.2)),
              child: SvgPicture.asset(
                Utils.getAssetSvg(svg),
                color: selectedCard == selected
                    ? AppColors.white
                    : AppColors.violetColor,
                height: SizeUtils.getHeight(32),
              ),
            ),
            verticalSpace(8),
            Text(
              card,
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
            width: SizeUtils.getWidth(24),
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
            width: SizeUtils.getWidth(24),
            color: AppColors.dividerLine,
          ),
        ],
      ),
    );
  }
}
