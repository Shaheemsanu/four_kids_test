import 'package:flutter/material.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/footer_button.dart';

class ReportDialog {
  final BuildContext parentContext;
  ReportDialog({required this.parentContext});

  final TextEditingController _productController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  show() {
    showDialog(
        barrierColor: AppColors.black.withOpacity(0.5),
        context: parentContext,
        builder: (context) {
          return SizedBox(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                SimpleDialog(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeUtils.getRadius(8))),
                  alignment: Alignment.center,
                  titlePadding: EdgeInsets.only(
                      top: SizeUtils.getHeight(24),
                      left: SizeUtils.getWidth(24)),
                  title: Text(
                    "Report",
                    style: FontUtils.getFont16Style(
                        color: AppColors.redColor, fontWeight: FontWeight.w500),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: SizeUtils.getWidth(24),
                      vertical: SizeUtils.getHeight(24)),
                  children: [
                    SizedBox(
                        width: SizeUtils.getWidth(250),
                        child: CustomTextField(
                            controller: _productController, label: "Product")),
                    verticalSpace(16),
                    SizedBox(
                      width: SizeUtils.getWidth(250),
                      child: CustomTextField(
                        controller: _descriptionController,
                        label: "Description",
                        maxLines: 3,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                footerBtn(),
                verticalSpace(24)
              ],
            ),
          );
        });
  }

  Widget footerBtn() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: FooterButton(
          label: "Submit",
          onTap: () {
            Navigator.pop(parentContext);
          }),
    );
  }
}
