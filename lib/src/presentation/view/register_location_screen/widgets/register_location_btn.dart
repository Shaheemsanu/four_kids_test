import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';

class RegisterLocationBtn extends StatelessWidget {
  const RegisterLocationBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.getHeight(24),
      width: SizeUtils.getHeight(24),
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: AppColors.lightBlue, padding: EdgeInsets.zero),
        child: SvgPicture.asset(
          Utils.getAssetSvg("ic_currentLocation"),
          height: SizeUtils.getHeight(20),
        ),
        onPressed: () {},
      ),
    );
  }
}
