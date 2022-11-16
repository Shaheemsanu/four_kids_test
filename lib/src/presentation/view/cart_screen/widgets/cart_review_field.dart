import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class CartReviewField extends StatelessWidget {
  const CartReviewField({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController remarkController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Remarks",
          style: FontUtils.getFont12Style(color: AppColors.black),
        ),
        verticalSpace(8),
        SizedBox(
          height: SizeUtils.getHeight(80),
          width: SizeUtils.getScreenWidth(),
          child: TextFormField(
            maxLines: 8,
            controller: remarkController,
            style: FontUtils.getFont14Style(color: AppColors.black),
            cursorColor: AppColors.black,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeUtils.getHeight(16),
                    horizontal: SizeUtils.getWidth(16)),
                hintStyle: FontUtils.getFont12Style(color: AppColors.fontGrey),
                hintText: "Type your comments here...",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(4))),
                fillColor: AppColors.btnGrey,
                filled: true),
          ),
        )
      ],
    );
  }
}
