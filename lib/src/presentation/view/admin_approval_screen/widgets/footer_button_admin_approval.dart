import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/admin_approval_screen/widgets/register_success_dialog.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/widgets/footer_button.dart';

class FooterButtonAdminApproval extends StatelessWidget {
  const FooterButtonAdminApproval({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: FooterButton(
          label: "Okay",
          onTap: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return const RegisterSuccessDialog();
                });
          }),
    );
  }
}
