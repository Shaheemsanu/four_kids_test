import 'package:flutter/cupertino.dart';
import 'package:fourkids/src/presentation/view/shop_screen/widgets/shop_sub_category_tile.dart';

import '../../../core/theme/size_utils.dart';

class ShopSubCategoryGrid extends StatelessWidget {
  const ShopSubCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        primary: false,
        shrinkWrap: true,
        padding: EdgeInsets.only(
            left: SizeUtils.getWidth(24),
            right: SizeUtils.getWidth(24),
            bottom: SizeUtils.getHeight(100)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: SizeUtils.getHeight(15) / SizeUtils.getWidth(18),
            mainAxisSpacing: SizeUtils.getHeight(8),
            crossAxisSpacing: SizeUtils.getWidth(8)),
        itemCount: 15,
        itemBuilder: (context, index) {
          return const ShopSubCategoryTile();
        });
  }
}
