import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';

class WelcomeDescription extends StatelessWidget {
  const WelcomeDescription({super.key});

  @override
  Widget build(BuildContext context) {
return RichText(
        text: TextSpan(
            text: "4Kids is the ",
            style: FontUtils.getFont16Style(
                color: AppColors.darkGrey, fontWeight: FontWeight.w400),
            children: [
          TextSpan(
              text: "business to business ",
              style: FontUtils.getFont16Style(
                  color: AppColors.lightBlue, fontWeight: FontWeight.w400)),
          TextSpan(
              text:
                  "online platform, which supports normal retail owners and manufactures/distributors.",
              style: FontUtils.getFont16Style(
                  color: AppColors.darkGrey, fontWeight: FontWeight.w400))
        ]));
  }
}