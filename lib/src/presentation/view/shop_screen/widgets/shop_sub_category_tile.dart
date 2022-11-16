import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/shop_screen/widgets/shop_gradient_container.dart';
import '../../../core/constants/common_navigate.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class ShopSubCategoryTile extends StatelessWidget {
  const ShopSubCategoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CommonNavigate(parentContext: context).navigateProductListingScreen();
      },
      child: SizedBox(
        height: SizeUtils.getHeight(120),
        width: SizeUtils.getWidth(100),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeUtils.getHeight(10)),
              child: const ShopGradientContainer(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeUtils.getHeight(80),
                  width: SizeUtils.getWidth(99),
                  child: Image.asset(
                    Utils.getAssetPng("sub_product"),
                    fit: BoxFit.cover,
                  ),
                ),
                verticalSpace(5),
                Text(
                  "Bicycles",
                  style: FontUtils.getFont14Style(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
