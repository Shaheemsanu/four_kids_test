import 'package:flutter/material.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/colors.dart';

class PageScrollIndicator extends StatefulWidget {
  final int totalCount;

  const PageScrollIndicator({Key? key, required this.totalCount})
      : super(key: key);

  @override
  State<PageScrollIndicator> createState() => PageScrollIndicatorState();
}

class PageScrollIndicatorState extends State<PageScrollIndicator> {
  int currentIndex = 0;
  changedIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.totalCount,
          (index) => InkWell(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: SizeUtils.getHeight(4),
              width: currentIndex == index
                  ? SizeUtils.getWidth(32)
                  : SizeUtils.getWidth(16),
              decoration: BoxDecoration(
                  color: currentIndex == index
                      ? AppColors.white
                      : AppColors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(4))),
              margin: EdgeInsets.only(right: SizeUtils.getWidth(4)),
            ),
          ),
        ));
  }
}
