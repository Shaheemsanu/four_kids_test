import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
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
                description()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget description() {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return SizedBox(
                height: SizeUtils.getHeight(120),
                width: SizeUtils.getScreenWidth(),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: SizeUtils.getHeight(32),
                          width: SizeUtils.getHeight(32),
                          decoration: BoxDecoration(
                              color: getCircleColor(index),
                              shape: BoxShape.circle),
                          child: Text(
                            "0${index + 1}",
                            textAlign: TextAlign.center,
                            style: FontUtils.getFont14Style(
                                color: getIndexColor(index)),
                          ),
                        ),
                        verticalSpace(4),
                        index == 3
                            ? verticalSpace(0)
                            : DottedLine(
                                lineLength: SizeUtils.getHeight(80),
                                dashGapColor: AppColors.white,
                                dashColor: AppColors.lightGrey,
                                direction: Axis.vertical,
                              )
                      ],
                    ),
                    horizontalSpace(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeUtils.getWidth(260),
                          child: Text(
                            "Adipiscing elit, sed do eiusmod tempor incididunt?",
                            maxLines: 2,
                            style: FontUtils.getFont16Style(
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkGrey),
                          ),
                        ),
                        verticalSpace(8),
                        SizedBox(
                          width: SizeUtils.getWidth(260),
                          child: Text(
                            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium",
                            maxLines: 3,
                            style: FontUtils.getFont14Style(
                                fontWeight: FontWeight.w400,
                                color: AppColors.fontGrey),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }));
  }

  Color getCircleColor(int index) {
    Color circleColor = const Color(0xFFDBF4FD);
    switch (index) {
      case 1:
        {
          circleColor = const Color(0xFFFCDBEF);
        }
        break;
      case 2:
        {
          circleColor = const Color(0xFFFCDFE0);
        }
        break;
      case 3:
        {
          circleColor = const Color(0xFFE3F5E6);
        }
        break;
    }
    return circleColor;
  }

  Color getIndexColor(int index) {
    Color textColor = AppColors.lightBlue;
    switch (index) {
      case 1:
        {
          textColor = AppColors.lightpink;
        }
        break;
      case 2:
        {
          textColor = AppColors.redColor;
        }
        break;
      case 3:
        {
          textColor = AppColors.primaryColor;
        }
        break;
    }
    return textColor;
  }
}
