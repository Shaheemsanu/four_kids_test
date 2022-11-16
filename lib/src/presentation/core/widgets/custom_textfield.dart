import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/size_utils.dart';
import '../theme/typography.dart';
import '../theme/utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {required this.label,
      this.controller,
      this.errorMessage,
      this.keyboardType,
      this.obscureText,
      this.textCapitalization,
      this.onTap,
      this.readOnly,
      this.maxLines,
      this.textInputAction,
      this.hint,
      this.autoFocus,
      this.enabled,
      this.maxLength,
      this.passwordField = false,
      this.suffix,
      this.prefix,
      this.validator,
      this.style,
      this.focusNode,
      this.onFieldSubmitted,
      this.inputFormatter,
      this.onChanged});
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function? validator;
  final bool? obscureText;
  final String? errorMessage;
  final TextCapitalization? textCapitalization;
  final bool? readOnly;
  final Function? onTap;
  final int? maxLines;
  final bool? autoFocus;
  final String? hint;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final TextStyle? style;
  final bool passwordField;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == ""
            ? verticalSpace(0)
            : Text(
                label,
                maxLines: 1,
                style: FontUtils.getFont16Style(
                    color: AppColors.fontGrey, fontWeight: FontWeight.w500),
              ),
        label == "" ? verticalSpace(0) : verticalSpace(8),
        TextFormField(
          showCursor: true,
          autofocus: autoFocus ?? false,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          readOnly: readOnly ?? false,
          enabled: enabled ?? true,
          textInputAction: textInputAction ?? TextInputAction.next,
          inputFormatters: inputFormatter,
          textCapitalization: textCapitalization ?? TextCapitalization.words,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChanged,
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          validator: (value) {
            if (validator != null && !validator!(value)) {
              return errorMessage ??
                  "Please enter a valid ${label.toLowerCase()}";
            }
            return null;
          },
          style: style ??
              FontUtils.getFont16Style(
                  color: AppColors.black, fontWeight: FontWeight.w500),
          obscureText: false,
          controller: controller,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          obscuringCharacter: '•',
          keyboardType: keyboardType,
          cursorColor: AppColors.black,
          decoration: InputDecoration(
              errorStyle: FontUtils.getFont12Style(
                  color: AppColors.redColor, fontWeight: FontWeight.w400),
              prefixIcon: prefix,
              counter: const SizedBox(),
              suffixIcon: suffix,
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.redColor),
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(5))),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.black),
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(5))),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.fontGrey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(5))),
              contentPadding: EdgeInsets.only(
                  left: SizeUtils.getWidth(16),
                  right: SizeUtils.getWidth(24),
                  top: SizeUtils.getHeight(16),
                  bottom: SizeUtils.getHeight(16)),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.fontGrey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(5)))),
        ),
      ],
    );
  }
}
