import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // log out
      },
      child: Row(
        children: [
          SvgPicture.asset(
            Utils.getAssetSvg('ic_logout'),
            height: SizeUtils.getHeight(18),
          ),
          horizontalSpace(8),
          Text(
            "Log Out",
            style: FontUtils.getFont14Style(
                color: AppColors.redColor, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
