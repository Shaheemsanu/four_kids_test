import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fourkids/src/presentation/view/profile_screen/widgets/logout.dart';
import 'package:fourkids/src/presentation/view/profile_screen/widgets/profile_user_details.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../widget/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          const ProfileUserDetails(),
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
}
