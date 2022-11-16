import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/footer_button.dart';

class RegisterSuccessDialog extends StatefulWidget {
  const RegisterSuccessDialog({Key? key}) : super(key: key);

  @override
  State<RegisterSuccessDialog> createState() => _RegisterSuccessDialogState();
}

class _RegisterSuccessDialogState extends State<RegisterSuccessDialog> {
  // count down timer
  // late CountdownTimerController timerController;

  // int endTime() => DateTime.now().millisecondsSinceEpoch + 1000 * 10;

  // count down timer

  @override
  void initState() {
    /*  timerController =
        CountdownTimerController(endTime: endTime(), onEnd: onEnd); */
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // timerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: SimpleDialog(
          titlePadding: EdgeInsets.only(top: SizeUtils.getHeight(24)),
          contentPadding: EdgeInsets.symmetric(
              horizontal: SizeUtils.getWidth(24),
              vertical: SizeUtils.getHeight(24)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(25))),
          /* title: Text(
            "Successfully Registered",
            textAlign: TextAlign.center,
            style: FontUtils.getFont16Style(color: AppColors.redColor, fontWeight: FontWeight.w500),
          ), */
          children: [
            SizedBox(
              height: SizeUtils.getHeight(150),
              width: SizeUtils.getHeight(150),
              child: Lottie.asset(Utils.getAssetLottie("registered"),
                  animate: true,
                  alignment: Alignment.center,
                  repeat: false,
                  fit: BoxFit.contain),
            ),
            Text(
              "Successfully Registered",
              textAlign: TextAlign.center,
              style: FontUtils.getFont20Style(
                  color: AppColors.primaryColor, fontWeight: FontWeight.w500),
            ),
            verticalSpace(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(16)),
              child: Text(
                "You can now starting shopping for your loved ones",
                textAlign: TextAlign.center,
                style: FontUtils.getFont14Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
            ),
            verticalSpace(24),
            FooterButton(
                label: "Let's Go",
                onTap: () {
                  CommonNavigate(parentContext: context).navigateHomeScreen();
                })
          ],
        ));
  }
}

/* WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: SimpleDialog(
        titlePadding: EdgeInsets.only(top: SizeUtils.getHeight(24)),
        contentPadding: EdgeInsets.symmetric(
            horizontal: SizeUtils.getWidth(50),
            vertical: SizeUtils.getHeight(24)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
        title: Text(
          "App is closing within",
          textAlign: TextAlign.center,
          style: FontUtils.getFont12Style(
              color: AppColors.redColor, fontWeight: FontWeight.w500),
        ),
        children: [
          timerCircle(),
          verticalSpace(24),
          greetingText(),
          verticalSpace(24),
          reviewText(),
          verticalSpace(24),
          footerbtn()
        ],
      ),
    );
  }

  Widget timerCircle() {
    return Container(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        height: SizeUtils.getHeight(64),
        width: SizeUtils.getHeight(64),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: AppColors.redColor.withOpacity(0.1)),
        child: countDownTimer());
  }

  Widget greetingText() {
    return Text(
      "Thank you for\nyour time",
      textAlign: TextAlign.center,
      style: FontUtils.getFont24Style(
          color: AppColors.black, fontWeight: FontWeight.w500),
    );
  }

  Widget reviewText() {
    return Text(
      "We will review and contact\nyou soon within 24 hrs",
      textAlign: TextAlign.center,
      style: FontUtils.getFont14Style(
          color: AppColors.fontGrey, fontWeight: FontWeight.w500),
    );
  }

  Widget countDownTimer() {
    return CountdownTimer(
      controller: timerController,
      widgetBuilder: (context, time) {
        if (time != null) {
          return Text(
            getTime(time.min) + ":" + getTime(time.sec),
            style: FontUtils.getFont16Style(
                color: AppColors.redColor, fontWeight: FontWeight.w500),
          );
        } else {
          return Text(
            "00:00",
            style: FontUtils.getFont16Style(
                color: AppColors.redColor, fontWeight: FontWeight.w500),
          );
        }
      },
    );
  }

  Widget footerbtn() {
    return SizedBox(
      height: SizeUtils.getHeight(56),
      width: SizeUtils.getScreenWidth(),
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(12))),
              backgroundColor: AppColors.redColor.withOpacity(0.1)),
          onPressed: () {
            // SystemNavigator.pop();

            CommonNavigate(parentContext: context).navigateHomeScreen();
          },
          child: Text(
            "Close App",
            style: FontUtils.getFont20Style(
                color: AppColors.redColor, fontWeight: FontWeight.w500),
          )),
    );
  }

  String getTime(int? time) {
    String t = '00';
    if (time != null) {
      if (time < 10) {
        t = "0$time";
      } else {
        t = "$time";
      }
    }
    return t;
  }

  onEnd() {
    if (Platform.isAndroid) {
      // SystemNavigator.pop();
      CommonNavigate(parentContext: context).navigateHomeScreen();
    }
  } */
