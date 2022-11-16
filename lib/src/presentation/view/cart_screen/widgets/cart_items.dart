import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fourkids/src/presentation/view/cart_screen/widgets/qty_counter.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/utils.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: SizeUtils.getScreenWidth(),
        child: ListView.builder(
            primary: false,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                height: SizeUtils.getHeight(105),
                width: SizeUtils.getScreenWidth(),
                margin: EdgeInsets.only(bottom: SizeUtils.getHeight(16)),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(4))),
                child: Row(
                  children: [
                    SizedBox(
                      height: SizeUtils.getHeight(100),
                      width: SizeUtils.getHeight(118),
                      child: Image.asset(
                        Utils.getAssetPng("skateboard"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(8),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // product name
                              Text(
                                "Skateboard",
                                style: FontUtils.getFont16Style(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: SizeUtils.getHeight(16),
                                width: SizeUtils.getHeight(16),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero),
                                  child: SvgPicture.asset(
                                    Utils.getAssetSvg("ic_delete"),
                                    height: SizeUtils.getHeight(16),
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                          verticalSpace(4),
                          Text(
                            "Consectetur adipiscing elit, sed...",
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            style: FontUtils.getFont12Style(
                                color: AppColors.fontGrey,
                                fontWeight: FontWeight.w400),
                          ),
                          verticalSpace(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "MRP",
                                    style: FontUtils.getFont10Style(
                                        color: AppColors.fontGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "₹860",
                                        style: FontUtils.getFont12Style(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: AppColors.fontGrey),
                                      ),
                                      horizontalSpace(4),
                                      Text(
                                        "₹760",
                                        style: FontUtils.getFont12Style(
                                            color: AppColors.primaryColor),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              QtyCounter(
                                onChange: (value) {
                                  // qty value
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    horizontalSpace(8)
                  ],
                ),
              );
            }));
  }
}
