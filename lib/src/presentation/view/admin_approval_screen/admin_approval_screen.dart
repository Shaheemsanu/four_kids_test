import 'package:flutter/material.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/footer_button.dart';
import '../admin_approval_screen/register_success_dialog.dart';

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
              mailImage(),
              verticalSpace(24),
              greetingText(),
              // verticalSpace(17),
              reviewTitle(),
              animateImage(),
              const Spacer(),
              description(),
              verticalSpace(12),
              mobileNumber(),
              verticalSpace(24),
              footerButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget mailImage() {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: SizeUtils.getHeight(104),
      width: SizeUtils.getHeight(104),
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(24),
          vertical: SizeUtils.getHeight(24)),
      decoration:
          const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
      child: Image.asset(
        Utils.getAssetPng("mail"),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget greetingText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(36)),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "Great! ",
              style: FontUtils.getFont20Style(
                  color: AppColors.lightpink, fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                    text: "Your Acccount\nRequested Succefully Submited.",
                    style: FontUtils.getFont20Style(
                        color: AppColors.black, fontWeight: FontWeight.w500))
              ])),
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

  Widget footerButton() {
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
