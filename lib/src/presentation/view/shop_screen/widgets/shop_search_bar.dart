import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/shop_screen/widgets/shop_filter.dart';
import 'package:fourkids/src/presentation/view/shop_screen/widgets/shop_search_text_field.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/utils.dart';

class ShopSearchBar extends StatelessWidget {
  const ShopSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.transparent,
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      height: SizeUtils.getHeight(40),
      width: SizeUtils.getScreenWidth(),
      child: Row(
        children: [
          const ShopSearchTextField(),
          horizontalSpace(8),
          const ShopFilter()
        ],
      ),
    );
  }
}
