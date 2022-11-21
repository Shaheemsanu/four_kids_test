import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fourkids/src/presentation/view/login_screen/widgets/login_footer_button.dart';
import 'package:fourkids/src/presentation/view/login_screen/widgets/login_sub_title.dart';
import 'package:fourkids/src/presentation/view/login_screen/widgets/login_terms_conditions.dart';
import 'package:fourkids/src/presentation/view/login_screen/widgets/login_textfield.dart';
import 'package:fourkids/src/presentation/view/login_screen/widgets/login_title.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/constants/form_validators.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/typography.dart';
import '../../core/theme/utils.dart';
import '../../core/widgets/custom_back_btn.dart';
import '../../core/widgets/custom_dialpad.dart';
import '../../core/widgets/custom_textfield.dart';
import '../../core/widgets/footer_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isKeyboardVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                image: DecorationImage(
                    image: AssetImage(Utils.getAssetPng("bg")),
                    fit: BoxFit.cover)),
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.getWidth(24),
                vertical: SizeUtils.getHeight(24)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          height: SizeUtils.getHeight(190),
                          child: Image.asset(
                            Utils.getAssetPng("login_image"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const Align(
                          alignment: Alignment.bottomCenter,
                          child: LoginTitle()),
                      const CustomBackButton(),
                    ],
                  ),
                ),
                const Spacer(),
                const LoginSubTitle(),
                verticalSpace(16),
                LoginTextFeild(phoneController: phoneController),
                verticalSpace(16),
                CustomDialpad(maxLength: 10, controller: phoneController),
                verticalSpace(8),
                const LoginTermsConditions(),
                verticalSpace(14),
                LoginFooterbutton(
                    formKey: _formKey, phoneController: phoneController)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* Widget title() {
    return Container(
      height: SizeUtils.getHeight(40),
      width: SizeUtils.getWidth(130),
      // clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(6))),
      /*   decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Utils.getAssetPng("parallelogram")), fit: BoxFit.cover)), */
      child: /* Transform.rotate(
        angle: -pi / 18,
        child: */
          Text(
        "Login",
        textAlign: TextAlign.center,
        style: FontUtils.getFont24Style(
            color: AppColors.black, fontWeight: FontWeight.w500),
      ),
      // ),
    );
  }

  Widget loginTextField() {
    return CustomTextField(
      autoFocus: true,
      validator: (value) {
        return FormValidators.defaultValidate(value);
      },
      readOnly: true,
      controller: phoneController,
      suffix: IconButton(
          onPressed: () {
            phoneController.clear();
          },
          icon: SvgPicture.asset(
            Utils.getAssetSvg("ic_clear"),
            height: SizeUtils.getHeight(16),
          )),
      prefix: Padding(
        padding: EdgeInsets.only(
            left: SizeUtils.getWidth(16),
            right: SizeUtils.getWidth(8),
            bottom: SizeUtils.getHeight(16),
            top: SizeUtils.getHeight(16)),
        child: Text(
          "+91",
          style: FontUtils.getFont16Style(
              color: AppColors.black, fontWeight: FontWeight.w500),
        ),
      ),
      label: "",
      onChanged: (value) {
        phoneController.selection =
            TextSelection.fromPosition(TextPosition(offset: value.length));
      },
      keyboardType: TextInputType.number,
      maxLength: 10,
      errorMessage: "Enter a valid phone number",
    );
  }

  Widget subTitle() {
    return Row(
      children: [
        SvgPicture.asset(
          Utils.getAssetSvg('ic_phone'),
          height: SizeUtils.getHeight(16),
        ),
        horizontalSpace(4),
        Text(
          "Continue with mobile number",
          style: FontUtils.getFont16Style(
              color: AppColors.darkGrey, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget termsConditions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(16)),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: "By providing my phon number, I hereby agree and accept the ",
            style: FontUtils.getFont12Style(
                color: AppColors.textGrey, fontWeight: FontWeight.w400),
            children: [
              TextSpan(
                  text: "Terms of Service ",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print("Terms & Condition"),
                  style: FontUtils.getFont12Style(
                      color: AppColors.violetColor,
                      fontWeight: FontWeight.w400)),
              TextSpan(
                text: "and ",
                style: FontUtils.getFont12Style(
                    color: AppColors.textGrey, fontWeight: FontWeight.w400),
              ),
              TextSpan(
                  text: "Privacy Policy ",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print("Privacy Policy"),
                  style: FontUtils.getFont12Style(
                      color: AppColors.violetColor,
                      fontWeight: FontWeight.w400)),
              TextSpan(
                text: "in use of the 4Kids app. ",
                style: FontUtils.getFont12Style(
                    color: AppColors.textGrey, fontWeight: FontWeight.w400),
              ),
            ]),
      ),
    );
  }

  Widget footerButton() {
    return FooterButton(
        label: "Submit",
        onTap: () {
          if (_formKey.currentState!.validate()) {
            CommonNavigate(parentContext: context).navigateOtpScreen();
          }
        });
  } */
}
