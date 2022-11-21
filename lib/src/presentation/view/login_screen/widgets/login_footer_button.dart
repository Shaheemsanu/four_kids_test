import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourkids/src/application/login/bloc/login_bloc.dart';
import '../../../core/constants/common_navigate.dart';
import '../../../core/widgets/footer_button.dart';

class LoginFooterbutton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  const LoginFooterbutton(
      {super.key, required this.formKey, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    /* WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    
    }); */
    return FooterButton(
        label: "Submit",
        onTap: () {
          if (formKey.currentState!.validate()) {
            BlocProvider.of<LoginBloc>(context).add(
                LoginEvent.getLoginData(phoneNumber: phoneController.text));
            CommonNavigate(parentContext: context).navigateOtpScreen();
          }
        });
  }
}
