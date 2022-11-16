import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/size_utils.dart';

class ScrollIndicator extends StatefulWidget {
  final int totalCount;
  const ScrollIndicator({Key? key, required this.totalCount}) : super(key: key);

  @override
  State<ScrollIndicator> createState() => ScrollIndicatorState();
}

class ScrollIndicatorState extends State<ScrollIndicator> {
  int currentIndex = 0;
  changedIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeUtils.getHeight(25)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            widget.totalCount,
            (index) => AnimatedContainer(
                  margin: EdgeInsets.only(
                      bottom: SizeUtils.getHeight(8),
                      right: SizeUtils.getWidth(8)),
                  height: SizeUtils.getHeight(8),
                  width: SizeUtils.getHeight(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == index
                          ? AppColors.lightpink
                          : AppColors.scrollinActive),
                  duration: const Duration(milliseconds: 200),
                )),
      ),
    );
  }
}
