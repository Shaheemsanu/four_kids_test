import 'package:flutter/material.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';

class QtyCounter extends StatefulWidget {
  final Function(int) onChange;
  const QtyCounter({Key? key, required this.onChange}) : super(key: key);

  @override
  State<QtyCounter> createState() => _QtyCounterState();
}

class _QtyCounterState extends State<QtyCounter> {
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeUtils.getHeight(24),
      // width: SizeUtils.getWidth(100),
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(8)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: SizeUtils.getHeight(24),
            width: SizeUtils.getHeight(24),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: AppColors.black,
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeUtils.getRadius(4))),
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColors.btnGrey),
              child: Icon(
                Icons.horizontal_rule,
                color: AppColors.fontGrey,
                size: SizeUtils.getHeight(20),
              ),
              onPressed: () {
                setState(() {
                  if (qty > 0) {
                    qty--;
                  }
                  widget.onChange(qty);
                });
              },
            ),
          ),
          horizontalSpace(9),
          Text(
            qty < 10 ? "0$qty" : qty.toString(),
            style: FontUtils.getFont14Style(
                color: AppColors.fontGrey, fontWeight: FontWeight.w600),
          ),
          horizontalSpace(9),
          SizedBox(
            height: SizeUtils.getHeight(24),
            width: SizeUtils.getHeight(24),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: AppColors.black,
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeUtils.getRadius(4))),
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColors.btnGrey),
              child: Icon(
                Icons.add,
                color: AppColors.fontGrey,
                size: SizeUtils.getHeight(20),
              ),
              onPressed: () {
                setState(() {
                  qty++;
                  widget.onChange(qty);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
