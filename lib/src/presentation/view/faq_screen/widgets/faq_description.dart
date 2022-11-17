import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class FaqDescription extends StatelessWidget {
  const FaqDescription({super.key});

  @override
  Widget build(BuildContext context) {
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
