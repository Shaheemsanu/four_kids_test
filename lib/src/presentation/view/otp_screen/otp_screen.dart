import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/typography.dart';
import '../../core/theme/utils.dart';
import '../../core/widgets/custom_back_btn.dart';
import '../../core/widgets/custom_dialpad.dart';
import '../../core/widgets/footer_button.dart';
import '../../core/widgets/otp_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // count down
  late CountdownTimerController timerController;

  int endTime() => DateTime.now().millisecondsSinceEpoch + 1000 * 60;

  // count down
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  late final CustomDialpad dialpad;
  final GlobalKey<OtpFieldState> _otpFieldKey = GlobalKey<OtpFieldState>();
  int selectedUser = -1;

  @override
  void initState() {
    super.initState();
    timerController =
        CountdownTimerController(endTime: endTime(), onEnd: onEnd);
  }

  @override
  void dispose() {
    otpController.dispose();
    timerController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant OtpScreen oldWidget) {
    // TODO: implement didUpdateWidget
    timerController =
        CountdownTimerController(endTime: endTime(), onEnd: onEnd);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.getWidth(24),
                vertical: SizeUtils.getHeight(24)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Utils.getAssetPng("bg")),
                    fit: BoxFit.cover),
                color: AppColors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: SizeUtils.getHeight(195),
                      width: SizeUtils.getScreenWidth(),
                      child: Stack(
                        clipBehavior: Clip.antiAlias,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: SizeUtils.getWidth(250),
                              height: SizeUtils.getHeight(195),
                              child: Image.asset(
                                Utils.getAssetPng("login_image"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: title()),
                          CustomBackButton(
                            onTap: () {
                              CommonNavigate(parentContext: context)
                                  .navigateLoginScreen();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                verticalSpace(20),
                subtitle(),
                verticalSpace(12),
                otpField(),
                // verticalSpace(8),
                resendBtn(),
                verticalSpace(16),

                CustomDialpad(maxLength: 4, controller: otpController),
                verticalSpace(12),
                footerButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dividerLine() {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeUtils.getHeight(25)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: SizeUtils.getHeight(1),
            width: SizeUtils.getWidth(20),
            color: AppColors.dividerLine,
          ),
          horizontalSpace(4),
          Text(
            "OR",
            style: FontUtils.getFont14Style(
                color: AppColors.orGrey, fontWeight: FontWeight.w500),
          ),
          horizontalSpace(4),
          Container(
            height: SizeUtils.getHeight(1),
            width: SizeUtils.getWidth(20),
            color: AppColors.dividerLine,
          ),
        ],
      ),
    );
  }

  Widget otpField() {
    return OtpField(
      key: _otpFieldKey,
      onChanged: (value) {},
      controller: otpController,
      onCompleted: (value) {},
    );
  }

  Widget title() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(6))),
      height: SizeUtils.getHeight(40),
      width: SizeUtils.getWidth(130),
      child: /* Transform.rotate(
        angle: -pi / 18,
        child: */
          Text(
        "OTP",
        textAlign: TextAlign.center,
        style: FontUtils.getFont24Style(
            color: AppColors.black, fontWeight: FontWeight.w500),
      ),
      // ),
    );
  }

  Widget subtitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          Utils.getAssetSvg('ic_phone'),
          height: SizeUtils.getHeight(16),
        ),
        horizontalSpace(4),
        Text(
          "We will send a OTP",
          style: FontUtils.getFont16Style(
              color: AppColors.darkGrey, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        countdownTimer()
      ],
    );
  }

  Widget resendBtn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: SizeUtils.getHeight(24),
          child: TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: AppColors.transparent),
            child: Text("Resend OTP",
                style: FontUtils.getFont12Style(
                    color: AppColors.fontGrey,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline)),
            onPressed: () {
              setState(() {
                timerController =
                    CountdownTimerController(endTime: endTime(), onEnd: onEnd);
                timerController.start();
                activateOtpField();
              });
            },
          ),
        ),
      ],
    );
  }

  Widget footerButton() {
    return FooterButton(
        label: "Verify",
        onTap: () {
          if (_formKey.currentState!.validate()) {
            CommonNavigate(parentContext: context).navigateHomeScreen();
            // CommonNavigate(parentContext: context).navigateRegisterLocationScreen();
          }
        });
  }

  Widget countdownTimer() {
    return CountdownTimer(
      controller: timerController,
      widgetBuilder: (
        context,
        time,
      ) {
        if (time != null) {
          return Text(
            getTime(time.min) + ":" + getTime(time.sec),
            style: FontUtils.getFont16Style(
                color: AppColors.fontGrey, fontWeight: FontWeight.w500),
          );
        } else {
          return Text("00:00",
              style: FontUtils.getFont16Style(
                  color: AppColors.fontGrey, fontWeight: FontWeight.w500));
        }
      },
      textStyle: FontUtils.getFont16Style(
          color: AppColors.fontGrey, fontWeight: FontWeight.w500),
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
    _otpFieldKey.currentState?.setEnable(false);
  }

  activateOtpField() {
    _otpFieldKey.currentState?.setEnable(true);
  }
}
