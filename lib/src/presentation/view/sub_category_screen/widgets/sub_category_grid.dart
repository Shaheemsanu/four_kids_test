import 'package:flutter/cupertino.dart';
import 'package:fourkids/src/presentation/view/sub_category_screen/widgets/sub_category_tile.dart';

import '../../../core/theme/size_utils.dart';

class SubCategoryGrid extends StatelessWidget {
  const SubCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
   return Flexible(
      child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
              vertical: SizeUtils.getHeight(16),
              horizontal: SizeUtils.getWidth(24)),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio:
                  SizeUtils.getHeight(15) / SizeUtils.getWidth(18),
              mainAxisSpacing: SizeUtils.getHeight(8),
              crossAxisSpacing: SizeUtils.getWidth(8)),
          itemCount: 30,
          itemBuilder: (context, index) {
            return const SubCategoryTile();
          }),
    );
  }
}