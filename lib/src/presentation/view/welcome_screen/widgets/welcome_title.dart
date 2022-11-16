import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: "4Kids is ",
            style: FontUtils.getFont32Style(fontWeight: FontWeight.w500),
            children: [
          TextSpan(
              text: "#1 ",
              style: FontUtils.getFont32Style(
                  color: AppColors.lightpink, fontWeight: FontWeight.w500)),
          TextSpan(
              text: "Toys Distributer In Kerala",
              style: FontUtils.getFont32Style(
                  color: AppColors.black, fontWeight: FontWeight.w500))
        ]));
  }
}