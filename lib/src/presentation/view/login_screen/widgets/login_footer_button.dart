import 'package:flutter/material.dart';
import '../../../core/constants/common_navigate.dart';
import '../../../core/widgets/footer_button.dart';

class LoginFooterbutton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginFooterbutton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return FooterButton(
        label: "Submit",
        onTap: () {
          if (formKey.currentState!.validate()) {
            CommonNavigate(parentContext: context).navigateOtpScreen();
          }
        });
  }
}
