import 'package:flutter/cupertino.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';

class CategoryImage extends StatelessWidget {
  const CategoryImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        height: SizeUtils.getHeight(110),
        width: SizeUtils.getWidth(100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeUtils.getRadius(40)),
                topLeft: Radius.circular(SizeUtils.getRadius(40)))),
        child: Image.asset(
          Utils.getAssetPng("category_image"),
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ));
  }
}
