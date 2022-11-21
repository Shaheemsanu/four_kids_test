import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/size_utils.dart';
import '../theme/typography.dart';

class FooterButton extends StatelessWidget {
  const FooterButton(
      {Key? key,
      required this.label,
      required this.onTap,
      this.height,
      this.width,
      this.padding,
      this.primary,
      this.style,
      this.shadowColor,
      this.color})
      : super(key: key);
  final String label;
  final void Function() onTap;
  final Color? color;
  final double? height;
  final double? width;
  final TextStyle? style;
  final Color? primary;
  final EdgeInsetsGeometry? padding;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(2), vertical: SizeUtils.getHeight(2)),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [AppColors.primaryColor, AppColors.linearGreen],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          /* boxShadow: [
        BoxShadow(
            color: shadowColor ?? AppColors.primaryColor,
            blurRadius: SizeUtils.getRadius(15)),
      ], */
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(16))),
      height: height ?? SizeUtils.getHeight(56),
      width: width ?? SizeUtils.getScreenWidth(),
      child: TextButton(
        style: TextButton.styleFrom(
            primary: primary ?? AppColors.black,
            shadowColor: shadowColor ?? AppColors.primaryColor.withOpacity(0.5),
            padding: padding ??
                EdgeInsets.symmetric(
                    vertical: SizeUtils.getHeight(5),
                    horizontal: SizeUtils.getHeight(10)),
            backgroundColor: color ?? AppColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(16)))),
        onPressed: onTap,
        child: Text(label,
            style: style ?? FontUtils.getFont20Style(color: AppColors.white)),
      ),
    );
  }
}
