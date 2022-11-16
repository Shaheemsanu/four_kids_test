import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fourkids/src/presentation/view/welcome_screen/widgets/welcome_description.dart';
import 'package:fourkids/src/presentation/view/welcome_screen/widgets/welcome_footer_button.dart';
import 'package:fourkids/src/presentation/view/welcome_screen/widgets/welcome_title.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/footer_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  final Tween<double> _tween = Tween(begin: 0, end: 1.0);

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SizedBox(
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          child: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.antiAlias,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Transform.scale(
                  scale: SizeUtils.getHeight(1),
                  child: Container(
                      margin: EdgeInsets.only(left: SizeUtils.getWidth(230)),
                      height: SizeUtils.getHeight(160),
                      width: SizeUtils.getHeight(160),
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.getWidth(2)),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: SizeUtils.getWidth(1.5),
                              color: AppColors.lightBlue),
                          // color: AppColors.white,
                          shape: BoxShape.circle),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          Utils.getAssetPng("welcome_image4"),
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Transform.scale(
                  scale: SizeUtils.getHeight(1),
                  child: Container(
                      margin: EdgeInsets.only(right: SizeUtils.getWidth(100)),
                      height: SizeUtils.getHeight(120),
                      width: SizeUtils.getHeight(120),
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.getWidth(2)),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: SizeUtils.getWidth(1.5),
                              color: AppColors.redColor),
                          // color: AppColors.white,
                          shape: BoxShape.circle),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          Utils.getAssetPng("welcome_image3"),
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeUtils.getWidth(114),
                    top: SizeUtils.getHeight(177)),
                child: ScaleTransition(
                  scale: /*  _animation */ _tween.animate(CurvedAnimation(
                      parent: _animationController, curve: Curves.easeIn)),
                  child: Container(
                    height: SizeUtils.getHeight(8),
                    width: SizeUtils.getHeight(8),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.redColor),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.only(
                      top: SizeUtils.getHeight(35),
                      right: SizeUtils.getWidth(19)),
                  height: SizeUtils.getHeight(190),
                  width: SizeUtils.getHeight(190),
                  padding:
                      EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(2)),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: SizeUtils.getWidth(1.5),
                          color: AppColors.linearPink2),
                      // color: AppColors.white,
                      shape: BoxShape.circle),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      Utils.getAssetPng("welcome_image2"),
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.only(
                      bottom: SizeUtils.getHeight(120),
                      left: SizeUtils.getWidth(19)),
                  height: SizeUtils.getHeight(190),
                  width: SizeUtils.getHeight(190),
                  padding:
                      EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(2)),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: SizeUtils.getWidth(1.5),
                          color: AppColors.linearyellow1),
                      // color: AppColors.white,
                      shape: BoxShape.circle),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      Utils.getAssetPng("welcome_image1"),
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: SizeUtils.getWidth(26),
                      bottom: SizeUtils.getHeight(250)),
                  child: ScaleTransition(
                    scale: /* _animation */ _tween.animate(CurvedAnimation(
                        parent: _animationController, curve: Curves.easeIn)),
                    child: Container(
                      height: SizeUtils.getHeight(8),
                      width: SizeUtils.getHeight(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.linearPink2),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: SizeUtils.getWidth(156),
                      top: SizeUtils.getHeight(90)),
                  child: ScaleTransition(
                    scale: /* _animation */ _tween.animate(CurvedAnimation(
                        parent: _animationController, curve: Curves.easeIn)),
                    child: Container(
                      height: SizeUtils.getHeight(14),
                      width: SizeUtils.getHeight(14),
                      decoration: const BoxDecoration(
                          color: AppColors.violetColor2,
                          shape: BoxShape.circle),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: SizeUtils.getHeight(180),
                      right: SizeUtils.getWidth(96)),
                  child: ScaleTransition(
                    scale: /* _animation */ _tween.animate(CurvedAnimation(
                        parent: _animationController, curve: Curves.easeIn)),
                    child: Container(
                      height: SizeUtils.getHeight(25),
                      width: SizeUtils.getHeight(25),
                      decoration: const BoxDecoration(
                          color: AppColors.lightpink, shape: BoxShape.circle),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: SizeUtils.getHeight(24),
                      right: SizeUtils.getWidth(26)),
                  child: ScaleTransition(
                    scale: /* _animation */ _tween.animate(CurvedAnimation(
                        parent: _animationController, curve: Curves.easeIn)),
                    child: Container(
                      height: SizeUtils.getHeight(8),
                      width: SizeUtils.getHeight(8),
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeUtils.getWidth(8), top: SizeUtils.getHeight(190)),
                child: ScaleTransition(
                  scale: /*  _animation */ _tween.animate(CurvedAnimation(
                      parent: _animationController, curve: Curves.easeIn)),
                  child: Container(
                    height: SizeUtils.getHeight(34),
                    width: SizeUtils.getHeight(34),
                    decoration: const BoxDecoration(
                        color: AppColors.lightBlue, shape: BoxShape.circle),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeUtils.getWidth(144),
                    top: SizeUtils.getHeight(21)),
                child: ScaleTransition(
                  scale: /*  _animation */ _tween.animate(CurvedAnimation(
                      parent: _animationController, curve: Curves.easeIn)),
                  child: Container(
                    height: SizeUtils.getHeight(19),
                    width: SizeUtils.getHeight(19),
                    decoration: const BoxDecoration(
                        color: AppColors.linearyellow1, shape: BoxShape.circle),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeUtils.getWidth(24),
                    vertical: SizeUtils.getHeight(24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "WELCOME TO 4 KIDS",
                      style: FontUtils.getFont14Style(
                          letterSpacing: SizeUtils.getWidth(3.5),
                          color: AppColors.fontGrey,
                          fontWeight: FontWeight.w600),
                    ),
                    verticalSpace(4),
                    const WelcomeTitle(),
                    verticalSpace(16),
                    const WelcomeDescription(),
                    verticalSpace(28),
                    const WelcomeFooterButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
