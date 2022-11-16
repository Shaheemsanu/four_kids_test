import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/constants/form_validators.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/widgets/custom_back_btn.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/custom_textfield.dart';
import '../../core/widgets/footer_button.dart';

class RegisterLocationScreen extends StatefulWidget {
  const RegisterLocationScreen({Key? key}) : super(key: key);

  @override
  State<RegisterLocationScreen> createState() => _RegisterLocationScreenState();
}

class _RegisterLocationScreenState extends State<RegisterLocationScreen> {
  bool isKeyBoardVisible = false;
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    companyNameController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isKeyBoardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Utils.getAssetPng("bg")),
                    fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(24),
                title(),
                const Spacer(),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      isKeyBoardVisible ? verticalSpace(0) : locationData(),
                      verticalSpace(55),
                      customerDetails(),
                    ],
                  ),
                ),
                const Spacer(),
                footerBtn(),
                verticalSpace(24)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.getWidth(24),
      ),
      width: SizeUtils.getScreenWidth(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CustomBackButton(
            color: AppColors.transparent,
          ),
          const Spacer(),
          Text(
            "Create new account",
            textAlign: TextAlign.center,
            style: FontUtils.getFont18Style(
                color: AppColors.black, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget locationData() {
    return Center(
        child: SizedBox(
      height: SizeUtils.getHeight(180),
      width: SizeUtils.getScreenWidth(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: SizeUtils.getHeight(104),
            width: SizeUtils.getHeight(104),
            padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.getWidth(24),
                vertical: SizeUtils.getHeight(24)),
            decoration: const BoxDecoration(
                color: AppColors.white, shape: BoxShape.circle),
            child: Image.asset(Utils.getAssetPng("location_image")),
          ),
          verticalSpace(16),
          Text(
            "Your Current ocation",
            style: FontUtils.getFont16Style(
                color: AppColors.fontGrey, fontWeight: FontWeight.w500),
          ),
          verticalSpace(9),
          SizedBox(
            width: SizeUtils.getWidth(222),
            child: Text(
              "Karimbully, Mele Pattambi...",
              maxLines: 1,
              style: FontUtils.getFont18Style(
                  color: AppColors.black, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    ));
  }

  Widget customerDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
              label: "Company Name",
              validator: (value) {
                return FormValidators.emptyValidate(value);
              },
              controller: companyNameController),
          verticalSpace(16),
          CustomTextField(
            validator: (value) {
              return FormValidators.emptyValidate(value);
            },
            label: "Location",
            controller: locationController,
            suffix: locationBtn(),
          ),
        ],
      ),
    );
  }

  Widget locationBtn() {
    return SizedBox(
      height: SizeUtils.getHeight(24),
      width: SizeUtils.getHeight(24),
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: AppColors.lightBlue, padding: EdgeInsets.zero),
        child: SvgPicture.asset(
          Utils.getAssetSvg("ic_currentLocation"),
          height: SizeUtils.getHeight(20),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget footerBtn() {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeUtils.getWidth(24),
          right: SizeUtils.getWidth(24),
          bottom: MediaQuery.of(context).viewPadding.bottom),
      child: Column(
        children: [
          Text(
            "You can change your location on sectetur adipiscing elit, sed do  ",
            textAlign: TextAlign.center,
            style: FontUtils.getFont14Style(
                color: AppColors.textGrey, fontWeight: FontWeight.w400),
          ),
          verticalSpace(16),
          FooterButton(
              label: "Next",
              onTap: () {
                // if (_formKey.currentState!.validate()) {
                CommonNavigate(parentContext: context)
                    .navigateCompanyRegistrationScreen();
                // }
              })
        ],
      ),
    );
  }
}
