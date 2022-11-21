import 'package:flutter/material.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import 'widgets/percentage_loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigatetoLoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: SizeUtils.getHeight(24)),
        height: SizeUtils.getScreenHeight(),
        width: SizeUtils.getScreenWidth(),
        decoration: BoxDecoration(
            color: AppColors.white,
            image: DecorationImage(
                image: AssetImage(Utils.getAssetPng("spbg")),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const Spacer(),
            logo(),
            verticalSpace(200),
            const PercentageLoader(),
            verticalSpace(18),
            Text(
              "FEEL THE WONDER OF TOYS",
              style: FontUtils.getFont14Style(color: AppColors.fontGrey),
            ),
            verticalSpace(8),
            Text(
              "POWERED BY GH",
              style: FontUtils.getFont10Style(color: AppColors.lightGrey),
            )
          ],
        ),
      ),
    );
  }

  Widget logo() {
    return Center(
      child: SizedBox(
        height: SizeUtils.getHeight(88),
        child: Image.asset(
          Utils.getAssetPng("splogo"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  navigatetoLoginScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    CommonNavigate(parentContext: context).navigateWelcomeScreen();
  }
}
