import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';
import '../../doc_upload_screen/widgets/select_mode_dialog.dart';
import 'business_dialog.dart';

class ProfileUserDetails extends StatefulWidget {
  const ProfileUserDetails({super.key});

  @override
  State<ProfileUserDetails> createState() => _ProfileUserDetailsState();
}

File? pickedImage;
final ImagePicker imagePicker = ImagePicker();

class _ProfileUserDetailsState extends State<ProfileUserDetails> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(12))),
          height: SizeUtils.getHeight(80),
          width: SizeUtils.getHeight(80),
          child: Stack(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.bottomRight,
            children: [
              pickedImage != null
                  ? SizedBox(
                      height: SizeUtils.getHeight(80),
                      width: SizeUtils.getHeight(80),
                      child: Image.file(
                        pickedImage!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(
                      Utils.getAssetPng("propic"),
                      fit: BoxFit.cover,
                    ),
              InkWell(
                onTap: () {
                  selectMode();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: SizeUtils.getHeight(12),
                      right: SizeUtils.getWidth(8)),
                  child: SvgPicture.asset(
                    Utils.getAssetSvg("ic_camera"),
                    color: AppColors.white,
                    height: SizeUtils.getHeight(20),
                  ),
                ),
              )
            ],
          ),
        ),
        horizontalSpace(24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "You're Verified",
                  style: FontUtils.getFont12Style(
                      color: AppColors.fontGrey, fontWeight: FontWeight.w400),
                ),
                horizontalSpace(2),
                SvgPicture.asset(
                  Utils.getAssetSvg("ic_verified"),
                  height: SizeUtils.getHeight(16),
                )
              ],
            ),
            verticalSpace(4),
            Text(
              "Kids Toy Store",
              style: FontUtils.getFont18Style(
                  color: AppColors.black, fontWeight: FontWeight.w400),
            ),
            verticalSpace(8),
            businessBtn()
          ],
        )
      ],
    );
  }

  Widget businessBtn() {
    return SizedBox(
      height: SizeUtils.getHeight(24),
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: AppColors.violetColor,
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(8)),
            side: const BorderSide(color: AppColors.violetColor),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(25)))),
        child: Text(
          "Change to Business Account",
          style: FontUtils.getFont12Style(
              color: AppColors.violetColor, fontWeight: FontWeight.w500),
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return BusinessDialog(parentContext: context).show();
              });
        },
      ),
    );
  }

  selectMode() {
    showDialog(
        context: context,
        builder: (context) {
          return SelectModeDialog(
            onSelect: (source) {
              pickImage(source);
            },
          );
        });
  }

  void pickImage(ImageSource source) async {
    try {
      XFile? imagePicked = await imagePicker.pickImage(source: source);
      if (imagePicked != null) {
        // setState(() {
        pickedImage = File(imagePicked.path);
        // });
        _setBase(pickedImage!);
      }
    } catch (_) {}
  }

  // base conversion
  _setBase(File image) async {
    List<int> imageBytes = [];
    imageBytes = image.readAsBytesSync();
    String base64 = base64Encode(imageBytes);
    // imageBase64 = base64;
    // widget.getImage(base64);
  }
}
