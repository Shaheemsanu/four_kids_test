import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/faq_screen/widgets/faq_description.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/widgets/custom_back_btn.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: Container(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            color: AppColors.white,
            padding: EdgeInsets.only(
                top: SizeUtils.getHeight(24),
                right: SizeUtils.getWidth(24),
                left: SizeUtils.getWidth(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(),
                verticalSpace(16),
                SizedBox(
                  height: SizeUtils.getHeight(60),
                  width: SizeUtils.getWidth(130),
                  child: Image.asset(Utils.getAssetPng("splogo"),
                      fit: BoxFit.contain),
                ),
                verticalSpace(32),
                Text(
                  "How it works?",
                  style: FontUtils.getFont24Style(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                ),
                verticalSpace(16),
                const FaqDescription()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
