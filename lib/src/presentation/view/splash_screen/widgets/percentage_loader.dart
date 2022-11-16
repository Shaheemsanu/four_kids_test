import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';

class PercentageLoader extends StatefulWidget {
  const PercentageLoader({Key? key}) : super(key: key);

  @override
  State<PercentageLoader> createState() => _PercentageLoaderState();
}

class _PercentageLoaderState extends State<PercentageLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  double limit = .65;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        lowerBound: 0,
        vsync: this,
        duration: const Duration(seconds: 2),
        animationBehavior: AnimationBehavior.normal)
      ..addListener(() {
        if (animationController.value >= limit) {
          limit = animationController.value;
          animationController.removeListener(() {});
        }
      });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(10),
          vertical: SizeUtils.getHeight(10)),
      height: SizeUtils.getHeight(68),
      width: SizeUtils.getHeight(68),
      child: Stack(
        children: [
          SizedBox(
            height: SizeUtils.getHeight(68),
            width: SizeUtils.getHeight(68),
            child: AnimatedBuilder(
                animation: CurvedAnimation(
                    parent: animationController, curve: Curves.easeIn),
                builder: ((context, child) {
                  return CircularProgressIndicator(
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.lightBlue),
                      value: animationController.value,
                      backgroundColor: AppColors.transparent,
                      color: AppColors.lightBlue);
                })),
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedBuilder(
              animation: CurvedAnimation(
                  parent: animationController, curve: Curves.easeIn),
              builder: (BuildContext context, Widget? child) {
                return Text("${(animationController.value * 100).toInt()}%",
                    style:
                        FontUtils.getFont12Style(color: AppColors.lightBlue));
              },
            ),
          ),
        ],
      ),
    );
  }
}
