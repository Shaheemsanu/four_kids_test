import 'package:flutter/cupertino.dart';
import 'package:fourkids/src/presentation/view/home_screen/widgets/product_list_item.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class HomeTrendingListView extends StatelessWidget {
  const HomeTrendingListView({super.key});

  @override
  Widget build(BuildContext context) {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeUtils.getWidth(24)),
          child: Text(
            "Trending Products",
            style: FontUtils.getFont24Style(
                color: AppColors.fontGrey, fontWeight: FontWeight.w500),
          ),
        ),
        verticalSpace(12),
        SizedBox(
          height: SizeUtils.getHeight(187),
          width: SizeUtils.getScreenWidth(),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                  left: SizeUtils.getWidth(24), right: SizeUtils.getWidth(24)),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ProductListItem(
                  width: 8,
                );
              }),
        ),
      ],
    );
  }
}