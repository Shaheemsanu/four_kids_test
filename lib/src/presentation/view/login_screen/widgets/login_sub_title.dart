import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class LoginSubTitle extends StatelessWidget {
  const LoginSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Utils.getAssetSvg('ic_phone'),
          height: SizeUtils.getHeight(16),
        ),
        horizontalSpace(4),
        Text(
          "Continue with mobile number",
          style: FontUtils.getFont16Style(
              color: AppColors.darkGrey, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
