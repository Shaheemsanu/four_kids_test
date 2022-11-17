import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constants/common_navigate.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';
import '../../../core/widgets/footer_button.dart';

class RegisterLoctionFooterBtn extends StatelessWidget {
  const RegisterLoctionFooterBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeUtils.getWidth(24),
          right: SizeUtils.getWidth(24),
          bottom: MediaQuery.of(context).viewPadding.bottom),
      child: Column(
        children: [
          Text(
            "You can change your location on sectetur adipiscing elit, sed do  ",
            textAlign: TextAlign.center,
            style: FontUtils.getFont14Style(
                color: AppColors.textGrey, fontWeight: FontWeight.w400),
          ),
          verticalSpace(16),
          FooterButton(
              label: "Next",
              onTap: () {
                // if (_formKey.currentState!.validate()) {
                CommonNavigate(parentContext: context)
                    .navigateCompanyRegistrationScreen();
                // }
              })
        ],
      ),
    );
  }
}