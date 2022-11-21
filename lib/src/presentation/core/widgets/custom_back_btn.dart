import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/colors.dart';
import '../theme/size_utils.dart';
import '../theme/utils.dart';

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({Key? key, this.onTap, this.color}) : super(key: key);
  final Color? color;
  final Function()? onTap;

  @override
  _CustomBackButtonState createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  Size btnSize = Size(SizeUtils.getHeight(25), SizeUtils.getHeight(25));
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.getHeight(32),
      width: SizeUtils.getHeight(32),
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
            alignment: Alignment.center,
            shape: const CircleBorder(),
            padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.getWidth(8),
                vertical: SizeUtils.getHeight(8)),
            backgroundColor: widget.color ?? AppColors.white,
            fixedSize: btnSize,
            tapTargetSize: MaterialTapTargetSize.padded,
            minimumSize: btnSize,
            maximumSize: btnSize),
        onPressed: widget.onTap ??
            () {
              Navigator.pop(context);
            },
        child: SvgPicture.asset(
          Utils.getAssetSvg("ic_backbtn"),
          fit: BoxFit.cover,
          height: SizeUtils.getHeight(12),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
