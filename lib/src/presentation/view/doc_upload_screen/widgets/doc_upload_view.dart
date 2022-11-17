import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';
import 'select_mode_dialog.dart';
import 'package:dotted_border/dotted_border.dart';

class DocUploadView extends StatefulWidget {
  final String text;
  final Function(String) getImage;
  const DocUploadView({Key? key, required this.getImage, required this.text})
      : super(key: key);

  @override
  State<DocUploadView> createState() => _DocUploadViewState();
}

class _DocUploadViewState extends State<DocUploadView> {
  final ImagePicker imagePicker = ImagePicker();
  File? pickedImage;
  int selectedCard = -1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMode();
      },
      child: pickedImage != null
          ? uploadedImage()
          : DottedBorder(
              borderType: BorderType.RRect,
              color: AppColors.primaryColor,
              strokeWidth: SizeUtils.getWidth(2),
              radius: Radius.circular(SizeUtils.getRadius(4)),
              dashPattern: const [6, 12, 2, 2],
              strokeCap: StrokeCap.square,
              child: Container(
                height: SizeUtils.getHeight(130),
                width: SizeUtils.getScreenWidth(),
                color: AppColors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeUtils.getHeight(24),
                      width: SizeUtils.getHeight(24),
                      child: SvgPicture.asset(Utils.getAssetSvg("ic_camera")),
                    ),
                    verticalSpace(8),
                    Text(
                      widget.text,
                      maxLines: 1,
                      style: FontUtils.getFont12Style(
                          color: AppColors.black, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
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
        setState(() {
          pickedImage = File(imagePicked.path);
        });
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
    widget.getImage(base64);
  }

  Widget uploadedImage() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(4))),
      height: SizeUtils.getHeight(130),
      width: SizeUtils.getScreenWidth(),
      child: Stack(
        children: [
          SizedBox(
            height: SizeUtils.getHeight(130),
            width: SizeUtils.getScreenWidth(),
            child: Image.file(
              pickedImage!,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(
                  top: SizeUtils.getHeight(12), right: SizeUtils.getWidth(12)),
              height: SizeUtils.getHeight(32),
              width: SizeUtils.getHeight(32),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.black,
                  backgroundColor: AppColors.transparent,
                  padding:
                      EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(4)),
                ),
                child: SvgPicture.asset(
                  Utils.getAssetSvg("ic_delete"),
                  height: SizeUtils.getHeight(24),
                ),
                onPressed: () {
                  setState(() {
                    pickedImage = null;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
