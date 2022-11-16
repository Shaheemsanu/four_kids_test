import 'package:flutter/cupertino.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeUtils.getHeight(40),
      width: SizeUtils.getWidth(130),
      // clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(6))),
      /*   decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Utils.getAssetPng("parallelogram")), fit: BoxFit.cover)), */
      child: /* Transform.rotate(
        angle: -pi / 18,
        child: */
          Text(
        "Login",
        textAlign: TextAlign.center,
        style: FontUtils.getFont24Style(
            color: AppColors.black, fontWeight: FontWeight.w500),
      ),
      // ),
    );
  }
}
