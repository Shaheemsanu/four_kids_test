import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../cart_screen/cart_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../shop_screen/shop_screen.dart';

class BottomNavScreen extends StatefulWidget {
  final int selectedIndex;
  const BottomNavScreen({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final PageStorageBucket bucket = PageStorageBucket();
  List<String> titles = ["Home", "Shop", "Cart", "Profile"];
  List<String> bottomNavIcons = ["ic_home", "ic_shop", "ic_cart", "ic_profile"];
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const ShopScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: AppColors.white,
      // extendBody: true,
      bottomNavigationBar: bottomNavBar(),
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Utils.getAssetPng("bg")),
                  fit: BoxFit.cover)),
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          child: PageStorage(
            bucket: bucket,
            child: screens[selectedIndex],
          ),
        ),
      ),
    );
  }

  Widget bottomNavBar() {
    return Arc(
        arcType: ArcType.CONVEX,
        edge: Edge.TOP,
        height: SizeUtils.getHeight(15),
        clipShadows: [
          ClipShadow(elevation: 70, color: AppColors.black),
          // ClipShadow(elevation: 70, color: AppColors.black),
          // ClipShadow(elevation: 70, color: AppColors.black)
        ],
        child: Container(
          color: AppColors.white,
          height: SizeUtils.getHeight(74),
          width: SizeUtils.getScreenWidth(),
          padding: EdgeInsets.only(
              right: SizeUtils.getWidth(24),
              left: SizeUtils.getWidth(24),
              top: SizeUtils.getHeight(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                bottomNavIcons.length,
                (index) => InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: SizeUtils.getHeight(50),
                        width: selectedIndex == index
                            ? SizeUtils.getWidth(75)
                            : SizeUtils.getWidth(24),
                        color: AppColors.white,
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Utils.getAssetSvg(bottomNavIcons[index]),
                                height: index == 0
                                    ? SizeUtils.getHeight(20)
                                    : SizeUtils.getHeight(24),
                                color: selectedIndex == index
                                    ? AppColors.lightpink
                                    : AppColors.black,
                              ),
                              if (selectedIndex == index)
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeUtils.getWidth(8)),
                                  child: Text(
                                    titles[index],
                                    style: FontUtils.getFont14Style(
                                        color: selectedIndex == index
                                            ? AppColors.lightpink
                                            : AppColors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ));
  }
}
