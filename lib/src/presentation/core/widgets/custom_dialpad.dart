import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';

class CustomDialpad extends StatelessWidget {
  final int maxLength;
  final TextEditingController controller;
  const CustomDialpad(
      {Key? key, required this.maxLength, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> numbers = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "",
      "0",
      "ic_backspace"
    ];

    return SizedBox(
      height: SizeUtils.getHeight(215),
      width: SizeUtils.getScreenWidth(),
      child: Wrap(
        clipBehavior: Clip.antiAlias,
        runAlignment: WrapAlignment.start,
        runSpacing: SizeUtils.getHeight(7),
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: SizeUtils.getWidth(7),
        children: List.generate(12, (index) {
          if (index == 9) {
            return SizedBox(
              height: SizeUtils.getHeight(48),
              width: SizeUtils.getWidth(95),
            );
          } else if (index == 11) {
            return SizedBox(
              height: SizeUtils.getHeight(48),
              width: SizeUtils.getWidth(95),
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(SizeUtils.getRadius(12))),
                    backgroundColor: const Color(0xFFC7DEE5).withOpacity(0.3),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeUtils.getWidth(14))),
                onPressed: () {
                  _backspace();
                },
                child: SvgPicture.asset(
                  Utils.getAssetSvg(numbers[index]),
                  color: AppColors.darkGrey,
                  height: SizeUtils.getHeight(16),
                ),
              ),
            );
          } else {
            return SizedBox(
              height: SizeUtils.getHeight(48),
              width: SizeUtils.getWidth(95),
              child: TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(SizeUtils.getRadius(12))),
                      backgroundColor: const Color(0xFFC7DEE5).withOpacity(0.3),
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.getWidth(40))),
                  onPressed: () {
                    if (controller.text.length < maxLength) {
                      _insertText(numbers[index]);
                    }
                  },
                  child: Text(
                    numbers[index],
                    style: FontUtils.getFont24Style(
                        color: AppColors.black, fontWeight: FontWeight.w500),
                  )),
            );
          }
        }),
      ),
    )

        /* SizedBox(
      height: SizeUtils.getHeight(215),
      width: SizeUtils.getScreenWidth(),
      child: GridView.builder(
          padding: EdgeInsets.only(bottom: SizeUtils.getHeight(12)),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 12,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: SizeUtils.getHeight(7),
            crossAxisSpacing: SizeUtils.getWidth(7),
            childAspectRatio: SizeUtils.getHeight(26) / SizeUtils.getWidth(12),
          ),
          itemBuilder: (context, index) {
            if (index == 9) {
              return const SizedBox();
            } else if (index == 11) {
              return TextButton(
                style: TextButton.styleFrom(
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeUtils.getRadius(12))),
                    backgroundColor: const Color(0xFFC7DEE5).withOpacity(0.3),
                    primary: AppColors.primaryColor,
                    padding: EdgeInsets.zero),
                onPressed: () {
                  _backspace();
                },
                child: SvgPicture.asset(
                  Utils.getAssetSvg(numbers[index]),
                  color: AppColors.darkGrey,
                ),
              );
            } else {
              return TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(SizeUtils.getRadius(12))),
                      backgroundColor:
                          Color(0xFFC7DEE5).withOpacity(0.3) /* AppColors.primaryColor.withOpacity(0.2) */,
                      primary: AppColors.primaryColor,
                      padding: EdgeInsets.zero),
                  onPressed: () {
                    if (controller.text.length < maxLength) {
                      _insertText(numbers[index]);
                    }
                  },
                  child: Text(
                    numbers[index],
                    style: FontUtils.getFont24Style(color: AppColors.black, fontWeight: FontWeight.w500),
                  ));
            }
          }),
    ) */
        ;
  }

  void _insertText(String myText) {
    final text = controller.text;
    final textSelection = controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    controller.text = newText;
    controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = controller.text;
    final textSelection = controller.selection;
    final selectionLength =
        textSelection.end - textSelection.start; // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      controller.text = newText;
      controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    } // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    } // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    controller.text = newText;
    controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }
}
