import 'package:flutter/cupertino.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';

class ShopGradientContainer extends StatelessWidget {
  const ShopGradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: SizeUtils.getHeight(40),
        width: SizeUtils.getWidth(100),
        child: Image.asset(
          Utils.getAssetPng("gradient_border"),
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
        ));
  }
}
