import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';

class LoginTermsConditions extends StatelessWidget {
  const LoginTermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(16)),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: "By providing my phon number, I hereby agree and accept the ",
            style: FontUtils.getFont12Style(
                color: AppColors.textGrey, fontWeight: FontWeight.w400),
            children: [
              TextSpan(
                  text: "Terms of Service ",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print("Terms & Condition"),
                  style: FontUtils.getFont12Style(
                      color: AppColors.violetColor,
                      fontWeight: FontWeight.w400)),
              TextSpan(
                text: "and ",
                style: FontUtils.getFont12Style(
                    color: AppColors.textGrey, fontWeight: FontWeight.w400),
              ),
              TextSpan(
                  text: "Privacy Policy ",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print("Privacy Policy"),
                  style: FontUtils.getFont12Style(
                      color: AppColors.violetColor,
                      fontWeight: FontWeight.w400)),
              TextSpan(
                text: "in use of the 4Kids app. ",
                style: FontUtils.getFont12Style(
                    color: AppColors.textGrey, fontWeight: FontWeight.w400),
              ),
            ]),
      ),
    );
  }
}
