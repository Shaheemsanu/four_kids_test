import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../theme/colors.dart';
import '../theme/size_utils.dart';
import '../theme/typography.dart';

class OtpField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String) onCompleted;
  final Function(String) onChanged;
  const OtpField(
      {Key? key,
      required this.onChanged,
      this.controller,
      required this.onCompleted})
      : super(key: key);

  @override
  OtpFieldState createState() => OtpFieldState();
}

class OtpFieldState extends State<OtpField> {
  bool isEnabled = true;

  setEnable(bool enabled) {
    setState(() {
      isEnabled = enabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoFocus: true,
      enablePinAutofill: false,
      readOnly: true,
      showCursor: false,
      length: 4,
      autoDisposeControllers: false,
      appContext: context,
      controller: widget.controller,
      onCompleted: widget.onCompleted,
      textStyle: FontUtils.getFont24Style(
          color: AppColors.black, fontWeight: FontWeight.w500),
      onChanged: widget.onChanged,
      validator: (value) {
        if (value?.length != 4) {
          return "Please enter a valid otp";
        }
        return null;
      },
      errorTextSpace: SizeUtils.getHeight(20),
      blinkDuration: const Duration(milliseconds: 1),
      pastedTextStyle: FontUtils.getFont24Style(),
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
          disabledColor: AppColors.fontGrey.withOpacity(0.2),
          borderWidth: SizeUtils.getHeight(1),
          shape: PinCodeFieldShape.box,
          activeColor: AppColors.borderGrey,
          activeFillColor: AppColors.white,
          inactiveFillColor: AppColors.white,
          selectedFillColor: AppColors.white,
          fieldHeight: SizeUtils.getHeight(60),
          fieldWidth: SizeUtils.getHeight(70),
          selectedColor: AppColors.borderGrey,
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(5)),
          inactiveColor: AppColors.borderGrey),
      backgroundColor: AppColors.transparent,
      cursorColor: AppColors.black,
      cursorHeight: SizeUtils.getHeight(24),
      enableActiveFill: true,
      enabled: isEnabled,
    );
  }
}
