import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/typography.dart';
import '../../core/theme/utils.dart';

class CustomQtyCounter extends StatefulWidget {
  final Function(int) onChange;
  const CustomQtyCounter({Key? key, required this.onChange}) : super(key: key);

  @override
  State<CustomQtyCounter> createState() => _CustomQtyCounterState();
}

class _CustomQtyCounterState extends State<CustomQtyCounter> {
  final TextEditingController _qtyCountroller = TextEditingController();
  int qty = 0;
  // var expression = RegExp('([-]?)([.]?)');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _qtyCountroller.text = "00";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _qtyCountroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: SizeUtils.getHeight(24),
          width: SizeUtils.getHeight(24),
          child: TextButton(
            style: TextButton.styleFrom(
                primary: AppColors.black,
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(4))),
                padding: EdgeInsets.zero,
                backgroundColor: AppColors.white),
            child: Icon(
              Icons.horizontal_rule,
              color: AppColors.fontGrey,
              size: SizeUtils.getHeight(20),
            ),
            onPressed: () {
              setState(() {
                if (qty > 0) {
                  qty--;
                  if (qty < 10) {
                    _qtyCountroller.text = "0$qty";
                  } else {
                    _qtyCountroller.text = "$qty";
                  }
                }
                widget.onChange(qty);
              });
            },
          ),
        ),
        horizontalSpace(8),
        SizedBox(
          width: SizeUtils.getWidth(60),
          height: SizeUtils.getHeight(40),
          child: TextField(
            onTap: () {
              if (_qtyCountroller.text.isEmpty) {
                _qtyCountroller.text = "00";
              }
            },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            selectionWidthStyle: BoxWidthStyle.tight,
            controller: _qtyCountroller,
            cursorColor: AppColors.black,
            textAlign: TextAlign.center,
            style: FontUtils.getFont18Style(
                color: AppColors.white, fontWeight: FontWeight.w500),
            onChanged: (value) {
              _qtyCountroller.selection = TextSelection.fromPosition(
                  TextPosition(offset: _qtyCountroller.text.length));
              if (value == "") {
                value = "00";
                qty = 0;
              } else {
                qty = int.parse(value);
              }
              widget.onChange(qty);
            },
            onSubmitted: (value) {
              if (value.isEmpty) {
                _qtyCountroller.text = '00';
              } else {
                if (qty < 10) {
                  _qtyCountroller.text = "0$qty";
                } else {
                  _qtyCountroller.text = "$qty";
                }
              }
              widget.onChange(qty);
            },
            decoration: InputDecoration(
                /*   errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.transparent),
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(5))), */
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide.none /* (color: AppColors.transparent) */,
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(5))),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide.none /* (color: AppColors.transparent) */,
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(5))),
                contentPadding:
                    EdgeInsets.symmetric(vertical: SizeUtils.getHeight(5)),
                /*  contentPadding: EdgeInsets.only(
                    left: SizeUtils.getWidth(16),
                    right: SizeUtils.getWidth(24),
                    top: SizeUtils.getHeight(16),
                    bottom: SizeUtils.getHeight(16)), */
                border: OutlineInputBorder(
                    borderSide: BorderSide
                        .none /* (
                        color: AppColors.transparent.withOpacity(0.5)) */
                    ,
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(5)))),
          ),
        ),
        horizontalSpace(8),
        SizedBox(
          height: SizeUtils.getHeight(24),
          width: SizeUtils.getHeight(24),
          child: TextButton(
            style: TextButton.styleFrom(
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(4))),
                primary: AppColors.black,
                padding: EdgeInsets.zero,
                backgroundColor: AppColors.white),
            child: Icon(
              Icons.add,
              color: AppColors.fontGrey,
              size: SizeUtils.getHeight(20),
            ),
            onPressed: () {
              setState(() {
                qty++;
                if (qty < 10) {
                  _qtyCountroller.text = "0$qty";
                } else {
                  _qtyCountroller.text = "$qty";
                }
                widget.onChange(qty);
              });
            },
          ),
        )
      ],
    );
  }
}
