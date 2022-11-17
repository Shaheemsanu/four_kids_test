import 'package:flutter/material.dart';
import '../../../core/constants/form_validators.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../company_registration_screen.dart';

class AdditionalNumberSelection extends StatelessWidget {
  const AdditionalNumberSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isAdded,
        builder: (context, value, child) {
          if (value) {
            return Column(
              children: [verticalSpace(6), phoneNumber(), verticalSpace(12)],
            );
          } else {
            return Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: SizeUtils.getHeight(24),
                width: SizeUtils.getHeight(24),
                child: TextButton(
                  style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      backgroundColor: AppColors.primaryColor),
                  child: Icon(Icons.add,
                      color: AppColors.white, size: SizeUtils.getHeight(20)),
                  onPressed: () {
                    isAdded.value = true;
                  },
                ),
              ),
            );
          }
        });
  }

  Widget phoneNumber() {
    final TextEditingController additionalNumber = TextEditingController();
    return CustomTextField(
      label: "Additional Number",
      controller: additionalNumber,
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (value) {
        return FormValidators.phoneValidate(value);
      },
    );
  }
}
