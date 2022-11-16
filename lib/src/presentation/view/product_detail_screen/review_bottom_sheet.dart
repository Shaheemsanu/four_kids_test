import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../widget/custom_rating_bar.dart';

class ReviewSheet {
  final BuildContext parentContext;
  ReviewSheet({required this.parentContext});

  show() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: AppColors.transparent,
        barrierColor: AppColors.black.withOpacity(0.1),
        context: parentContext,
        builder: (context) {
          return SizedBox(
            height: SizeUtils.getHeight(730),
            width: SizeUtils.getScreenWidth(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Spacer(),
                SizedBox(
                  height: SizeUtils.getHeight(48),
                  width: SizeUtils.getHeight(48),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: const CircleBorder()),
                    child: SvgPicture.asset(
                      Utils.getAssetSvg("ic_close"),
                      height: SizeUtils.getHeight(24),
                    ),
                  ),
                ),
                verticalSpace(32),
                Arc(
                  edge: Edge.TOP,
                  arcType: ArcType.CONVEX,
                  height: SizeUtils.getHeight(18),
                  child: Container(
                    height: SizeUtils.getHeight(600),
                    width: SizeUtils.getScreenWidth(),
                    color: AppColors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: SizeUtils.getHeight(40),
                              left: SizeUtils.getWidth(24)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ratings",
                                style: FontUtils.getFont18Style(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              verticalSpace(8),
                              Text(
                                "21 Customer Reviews ",
                                style: FontUtils.getFont12Style(
                                    color: AppColors.fontGrey,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        verticalSpace(24),
                        ScrollConfiguration(
                          behavior: NoGlowScrollBehaviour(),
                          child: Expanded(
                            // height: SizeUtils.getHeight(345),
                            // width: SizeUtils.getScreenWidth(),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 12,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        bottom: SizeUtils.getHeight(16)),
                                    width: SizeUtils.getScreenWidth(),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  SizeUtils.getWidth(24)),
                                          width: SizeUtils.getScreenWidth(),
                                          child: Text(
                                            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
                                            maxLines: 3,
                                            textAlign: TextAlign.left,
                                            style: FontUtils.getFont16Style(
                                                color: AppColors.iconGrey,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        verticalSpace(12),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  SizeUtils.getWidth(24)),
                                          child: Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                clipBehavior: Clip.antiAlias,
                                                height: SizeUtils.getHeight(32),
                                                width: SizeUtils.getWidth(32),
                                                decoration: const BoxDecoration(
                                                  color: AppColors.lightpink,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Text(
                                                  "FM",
                                                  style:
                                                      FontUtils.getFont10Style(
                                                          color:
                                                              AppColors.white,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                              ),
                                              horizontalSpace(8),
                                              Text(
                                                "Floyd Miles",
                                                maxLines: 1,
                                                style: FontUtils.getFont14Style(
                                                    color: AppColors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const Spacer(),
                                              CustomRatingBar(
                                                initialRating: 3,
                                                onRatingUpdate: (value) {},
                                              )
                                            ],
                                          ),
                                        ),
                                        verticalSpace(16),
                                        index == 12 - 1
                                            ? verticalSpace(0)
                                            : Container(
                                                height: SizeUtils.getHeight(1),
                                                width:
                                                    SizeUtils.getScreenWidth(),
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                        colors: [
                                                      AppColors.lineGrey,
                                                      AppColors.lineGrey
                                                          .withOpacity(0.5),
                                                      AppColors.transparent
                                                    ])),
                                              )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
