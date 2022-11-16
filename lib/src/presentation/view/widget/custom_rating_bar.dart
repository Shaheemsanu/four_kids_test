import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
class CustomRatingBar extends StatefulWidget {
  final Function(double)? onRatingUpdate;
  final bool? ignoreGestures;
  final double? initialRating;
  final double? height;
  final double? padding;
  const CustomRatingBar(
      {Key? key,
      this.initialRating,
      this.height,
      this.padding,
      this.ignoreGestures,
      this.onRatingUpdate})
      : super(key: key);

  @override
  State<CustomRatingBar> createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeUtils.getHeight(16),
      // width: SizeUtils.getWidth(120),
      child: RatingBar(
        itemPadding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(2)),
        itemCount: 5,
        direction: Axis.horizontal,
        itemSize: SizeUtils.getHeight(16),
        minRating: 3,
        onRatingUpdate: widget.onRatingUpdate!,
        initialRating: widget.initialRating ?? 0,
        ratingWidget: RatingWidget(
            full: SvgPicture.asset(
              Utils.getAssetSvg("ic_rate"),
              height: SizeUtils.getHeight(16),
              color: AppColors.linearyellow1,
            ),
            half: SvgPicture.asset(
              Utils.getAssetSvg("ic_rate"),
              height: SizeUtils.getHeight(16),
              color: AppColors.linearyellow1,
            ),
            empty: SvgPicture.asset(
              Utils.getAssetSvg("ic_rate"),
              height: SizeUtils.getHeight(16),
              color: AppColors.fontGrey,
            )),
        ignoreGestures: widget.ignoreGestures ?? true,
      ),
    );
  }
}
