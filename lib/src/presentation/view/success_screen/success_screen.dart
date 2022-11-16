import 'package:flutter/material.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/footer_button.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          color: AppColors.white,
          child: Column(
            children: [
              SizedBox(
                  height: SizeUtils.getHeight(270),
                  width: SizeUtils.getScreenWidth(),
                  child: Image.asset(
                    Utils.getAssetPng("success_bg"),
                    fit: BoxFit.cover,
                  )),
              const Spacer(),
              successText(),
              verticalSpace(24),
              confirmationText(),
              const Spacer(),
              homeGoldText(),
              verticalSpace(24),
              footerButton(),
              verticalSpace(24)
            ],
          ),
        ),
      ),
    );
  }

  Widget successText() {
    return Text(
      "You’re order was\nsuccessfully completed",
      textAlign: TextAlign.center,
      style: FontUtils.getFont24Style(
          color: AppColors.black, fontWeight: FontWeight.w500),
    );
  }

  Widget confirmationText() {
    return Text(
      "You will be receiving a confirmation\nemail with order details.",
      textAlign: TextAlign.center,
      style: FontUtils.getFont16Style(
          color: AppColors.fontGrey, fontWeight: FontWeight.w400),
    );
  }

  Widget homeGoldText() {
    return Text(
      "Your’e order on the way",
      style: FontUtils.getFont48HomeStyle(
          color: AppColors.lightBlue, fontWeight: FontWeight.w400),
    );
  }

  Widget footerButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: FooterButton(
          label: "Home",
          onTap: () {
            CommonNavigate(parentContext: context).navigateHomeScreen();
          }),
    );
  }
}
