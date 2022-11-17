import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/register_location_screen/widgets/register_lctn_customer_details.dart';
import 'package:fourkids/src/presentation/view/register_location_screen/widgets/register_location_data.dart';
import 'package:fourkids/src/presentation/view/register_location_screen/widgets/register_location_footer_btn.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/widgets/custom_back_btn.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';

class RegisterLocationScreen extends StatefulWidget {
  const RegisterLocationScreen({Key? key}) : super(key: key);

  @override
  State<RegisterLocationScreen> createState() => _RegisterLocationScreenState();
}

class _RegisterLocationScreenState extends State<RegisterLocationScreen> {
  bool isKeyBoardVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      isKeyBoardVisible
                          ? verticalSpace(0)
                          : const RegisterLoctionData(),
                      verticalSpace(55),
                      const RegisterLctnCustomerDetails(),
                    ],
                  ),
                ),
                const Spacer(),
                const RegisterLoctionFooterBtn(),
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
}
