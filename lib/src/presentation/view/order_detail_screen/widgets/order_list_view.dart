import 'package:flutter/cupertino.dart';
import '../../../core/theme/size_utils.dart';
import '../../home_screen/widgets/product_list_item.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: SizeUtils.getScreenWidth(),
        height: SizeUtils.getHeight(187),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: SizeUtils.getWidth(24)),
            itemCount: 12,
            itemBuilder: (context, index) {
              return const ProductListItem(width: 16);
            }));
  }
}
