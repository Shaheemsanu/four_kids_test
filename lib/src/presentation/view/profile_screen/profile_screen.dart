import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fourkids/src/presentation/view/profile_screen/widgets/logout.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../doc_upload_screen/widgets/select_mode_dialog.dart';
import '../widget/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker imagePicker = ImagePicker();
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeUtils.getScreenHeight(),
      width: SizeUtils.getScreenWidth(),
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(24),
          vertical: SizeUtils.getHeight(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: "Profile"),
          verticalSpace(45),
          userDetails(),
          verticalSpace(65),
          profileRowList(
              "Order Histroy",
              () => CommonNavigate(parentContext: context)
                  .navigateOrderHistoryScreen()),
          verticalSpace(5),
          profileRowList(
              "My Account",
              () => CommonNavigate(parentContext: context)
                  .navigateMyAccountScreen()),
          verticalSpace(5),
          profileRowList(
              "Branches",
              () =>
                  CommonNavigate(parentContext: context).navigateStoreScreen()),
          verticalSpace(5),
          profileRowList("FAQ's",
              () => CommonNavigate(parentContext: context).navigateFaqScreen()),
          verticalSpace(5),
          profileRowList("Support", () => null),
          verticalSpace(5),
          profileRowList("About Us", () => null),
          const Spacer(),
          const LogOut(),
          verticalSpace(70)
        ],
      ),
    );
  }

  Widget profileRowList(String title, Function() onTap) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: FontUtils.getFont16Style(
                color: AppColors.fontGrey, fontWeight: FontWeight.w500),
          ),
          SvgPicture.asset(
            Utils.getAssetSvg("ic_next"),
            height: SizeUtils.getHeight(16),
            color: AppColors.fontGrey,
          )
        ],
      ),
    );
  }

  Widget userDetails() {
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

class BusinessDialog {
  final BuildContext parentContext;
  BusinessDialog({required this.parentContext});

  show() {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(12))),
      contentPadding: EdgeInsets.symmetric(
          vertical: SizeUtils.getHeight(32),
          horizontal: SizeUtils.getWidth(16)),
      backgroundColor: AppColors.white,
      titlePadding: EdgeInsets.only(
          left: SizeUtils.getWidth(32),
          right: SizeUtils.getWidth(32),
          top: SizeUtils.getHeight(32)),
      title: Text(
        "Are you sure you want to change to Business",
        textAlign: TextAlign.center,
        style: FontUtils.getFont16Style(
            color: AppColors.black, fontWeight: FontWeight.w500),
      ),
      children: [
        Text(
          "By confirming, you are changing your account into Business Account",
          maxLines: 3,
          textAlign: TextAlign.center,
          style: FontUtils.getFont12Style(
              color: AppColors.fontGrey, fontWeight: FontWeight.w400),
        ),
        verticalSpace(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.primaryColor,
                    padding: EdgeInsets.symmetric(
                        vertical: SizeUtils.getHeight(16),
                        horizontal: SizeUtils.getWidth(24))),
                child: Text(
                  "Confirm",
                  style: FontUtils.getFont14Style(
                      color: AppColors.white, fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  CommonNavigate(parentContext: parentContext)
                      .navigateRegisterLocationScreen();
                },
              ),
            ),
            horizontalSpace(16),
            SizedBox(
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeUtils.getHeight(16),
                        horizontal: SizeUtils.getWidth(32))),
                child: Text(
                  "Cancel",
                  style: FontUtils.getFont14Style(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.pop(parentContext);
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
