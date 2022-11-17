import 'package:flutter/cupertino.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../widget/custom_qty_counter.dart';

class ProductQtyCounter extends StatelessWidget {
  const ProductQtyCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(70)),
      height: SizeUtils.getHeight(40),
      // width: SizeUtils.getWidth(150),
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(8), vertical: SizeUtils.getHeight(2)),
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                AppColors.black.withOpacity(0.2),
                AppColors.transparent
              ])),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
        color: AppColors.lightBlue,
      ),
      child: CustomQtyCounter(
        onChange: (value) {
          // value qty
        },
      ),
    );
  }
}
