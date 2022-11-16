import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/form_validators.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';
import '../../../core/widgets/custom_textfield.dart';

class LoginTextFeild extends StatelessWidget {
  final TextEditingController phoneController;
  const LoginTextFeild({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      autoFocus: true,
      validator: (value) {
        return FormValidators.phoneValidate(value);
      },
      readOnly: true,
      controller: phoneController,
      suffix: IconButton(
          onPressed: () {
            phoneController.clear();
          },
          icon: SvgPicture.asset(
            Utils.getAssetSvg("ic_clear"),
            height: SizeUtils.getHeight(16),
          )),
      prefix: Padding(
        padding: EdgeInsets.only(
            left: SizeUtils.getWidth(16),
            right: SizeUtils.getWidth(8),
            bottom: SizeUtils.getHeight(16),
            top: SizeUtils.getHeight(16)),
        child: Text(
          "+91",
          style: FontUtils.getFont16Style(
              color: AppColors.black, fontWeight: FontWeight.w500),
        ),
      ),
      label: "",
      onChanged: (value) {
        phoneController.selection =
            TextSelection.fromPosition(TextPosition(offset: value.length));
      },
      keyboardType: TextInputType.number,
      maxLength: 10,
      errorMessage: "Enter a valid phone number",
    );
  }
}
