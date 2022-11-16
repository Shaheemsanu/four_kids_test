import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/footer_button.dart';
import '../widget/custom_app_bar.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: Container(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            padding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(24),
                horizontal: SizeUtils.getWidth(24)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Utils.getAssetPng("bg")),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomAppBar(title: "Branches"),
                verticalSpace(16),
                Flexible(
                    child: ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return storeTile(index);
                        })),
                const Spacer(),
                FooterButton(
                    label: "Add Branch",
                    onTap: () {
                      CommonNavigate(parentContext: context)
                          .navigateRegisterLocationScreen();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget storeTile(int index) {
    index++;
    return Container(
      margin: EdgeInsets.only(bottom: SizeUtils.getHeight(8)),
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(16),
          vertical: SizeUtils.getHeight(16)),
      width: SizeUtils.getScreenWidth(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
        color: AppColors.violetColor.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                Utils.getAssetSvg("ic_store"),
                height: SizeUtils.getHeight(24),
              ),
              horizontalSpace(6),
              Text(
                "MyBranch #$index",
                style: FontUtils.getFont16Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              SizedBox(
                height: SizeUtils.getHeight(24),
                width: SizeUtils.getHeight(24),
                child: TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: AppColors.violetColor,
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.getWidth(4))),
                  child: SvgPicture.asset(Utils.getAssetSvg("ic_edit"),
                      color: AppColors.metalicBlack),
                  onPressed: () {},
                ),
              ),
              horizontalSpace(8),
              SizedBox(
                height: SizeUtils.getHeight(24),
                width: SizeUtils.getHeight(24),
                child: TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: AppColors.violetColor,
                      padding: EdgeInsets.zero),
                  child: SvgPicture.asset(Utils.getAssetSvg("ic_del"),
                      color: AppColors.redColor),
                  onPressed: () {},
                ),
              )
            ],
          ),
          verticalSpace(8),
          SizedBox(
            width: SizeUtils.getWidth(250),
            child: Text(
              "Room 107 First Floor, Madrasa Building, Mele Pattambi, Kerala 679303, India",
              textAlign: TextAlign.left,
              maxLines: 3,
              style: FontUtils.getFont14Style(
                  color: AppColors.fontGrey, fontWeight: FontWeight.w400),
            ),
          ),
          verticalSpace(8),
          Text(
            "Contact: 9876543210 ",
            style: FontUtils.getFont14Style(color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
