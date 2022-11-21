import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourkids/src/application/login/bloc/login_bloc.dart';
import '../../../core/constants/common_navigate.dart';
import '../../../core/widgets/footer_button.dart';

class LoginFooterbutton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginFooterbutton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<LoginBloc>(context).add(const LoginEvent.getLoginData());
    });
    return FooterButton(
        label: "Submit",
        onTap: () {
          if (formKey.currentState!.validate()) {
            CommonNavigate(parentContext: context).navigateOtpScreen();
          }
        });
  }
}
