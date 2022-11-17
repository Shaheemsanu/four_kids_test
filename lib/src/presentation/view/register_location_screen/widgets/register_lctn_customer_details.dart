import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/register_location_screen/widgets/register_location_btn.dart';
import '../../../core/constants/form_validators.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';
import '../../../core/widgets/custom_textfield.dart';

class RegisterLctnCustomerDetails extends StatelessWidget {
  const RegisterLctnCustomerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController companyNameController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
              label: "Company Name",
              validator: (value) {
                return FormValidators.emptyValidate(value);
              },
              controller: companyNameController),
          verticalSpace(16),
          CustomTextField(
            validator: (value) {
              return FormValidators.emptyValidate(value);
            },
            label: "Location",
            controller: locationController,
            suffix: const RegisterLocationBtn(),
          ),
        ],
      ),
    );
  }
}
