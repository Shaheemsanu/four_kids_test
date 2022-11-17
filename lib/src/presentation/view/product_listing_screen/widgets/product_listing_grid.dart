import 'package:flutter/material.dart';

import '../../../core/constants/common_navigate.dart';
import '../../../core/theme/size_utils.dart';
import '../../home_screen/widgets/product_list_item.dart';

class ProductListingGrid extends StatelessWidget {
  const ProductListingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: GridView.builder(
            padding: EdgeInsets.only(bottom: SizeUtils.getHeight(50)),
            itemCount: 12,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio:
                  SizeUtils.getHeight(15) / SizeUtils.getWidth(18),
              crossAxisSpacing: SizeUtils.getWidth(16),
              mainAxisSpacing: SizeUtils.getHeight(16),
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    CommonNavigate(parentContext: context)
                        .navigateProductDetailScreen();
                  },
                  child: const ProductListItem(width: 0));
            }));
  }
}
