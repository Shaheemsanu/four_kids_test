import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/admin_approval_screen/widgets/footer_button_admin_approval.dart';
import 'package:fourkids/src/presentation/view/admin_approval_screen/widgets/greeting_text_admin_approval.dart';
import 'package:fourkids/src/presentation/view/admin_approval_screen/widgets/mail_image_admin_approval.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/footer_button.dart';
import 'widgets/register_success_dialog.dart';

class AdminApprovalScreen extends StatefulWidget {
  const AdminApprovalScreen({Key? key}) : super(key: key);

  @override
  State<AdminApprovalScreen> createState() => _AdminApprovalScreenState();
}

class _AdminApprovalScreenState extends State<AdminApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          padding: EdgeInsets.symmetric(vertical: SizeUtils.getHeight(24)),
          decoration: BoxDecoration(
              color: AppColors.white,
              image: DecorationImage(
                  image: AssetImage(Utils.getAssetPng("bg")),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              verticalSpace(48),
              const MailImageAdminApproval(),
              verticalSpace(24),
              const GreetingTextAdminApproval(),
              // verticalSpace(17),
              reviewTitle(),
              animateImage(),
              const Spacer(),
              description(),
              verticalSpace(12),
              mobileNumber(),
              verticalSpace(24),
              const FooterButtonAdminApproval()
            ],
          ),
        ),
      ),
    );
  }

  Widget reviewTitle() {
    return Text(
      "We will review and contact you soon",
      maxLines: 1,
      style: FontUtils.getFont14Style(
          color: AppColors.fontGrey, fontWeight: FontWeight.w500),
    );
  }

  Widget animateImage() {
    return SizedBox(
      height: SizeUtils.getHeight(270),
      width: SizeUtils.getScreenWidth(),
      child: Image.asset(
        Utils.getAssetPng("train"),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget description() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: Text(
        'Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magn.',
        textAlign: TextAlign.center,
        maxLines: 2,
        style: FontUtils.getFont14Style(
            color: AppColors.textGrey, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget mobileNumber() {
    return Text(
      "+91 9874563210",
      style: FontUtils.getFont24Style(
          color: AppColors.black, fontWeight: FontWeight.w500),
    );
  }
}
