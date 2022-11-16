
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  int selectedColor = -1;
  int selectedSize = -1;
  int selectedSort = 0;
  int selectQTy = 0;
  List<String> filterAges = ["04-06", "06-10", "12-16"];
  List<String> ageSelected = [];
  List<Color> selectedColors = [];
  List<int> selectedSizes = [];
  List<Color> colors = [
    AppColors.lightpink,
    AppColors.linearGreen,
    AppColors.redColor,
    AppColors.lightBlue
  ];

  double _startValue = 100;
  double _endValue = 2000;

  List<String> size = ["S", "M", "L", "XL"];

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowScrollBehaviour(),
      child: SizedBox(
        height: SizeUtils.getScreenHeight(),
        width: SizeUtils.getScreenWidth(),
        child: Column(
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
                  padding: EdgeInsets.only(
                    top: SizeUtils.getHeight(45),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        applybtn(),
                        verticalSpace(24),
                        sortbyPrice(),
                        verticalSpace(24),
                        selecteQuality(),
                        verticalSpace(16),
                        ageSelector(),
                        verticalSpace(14),
                        dividerLine(),
                        verticalSpace(14),
                        priceSlider(),
                        verticalSpace(10),
                        dividerLine(),
                        verticalSpace(10),
                        sizeSelector(),
                        verticalSpace(10),
                        dividerLine(),
                        verticalSpace(10),
                        colorSelection()
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget colorSelection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "COLOR",
            style: FontUtils.getFont16Style(
                color: AppColors.mattBlack, fontWeight: FontWeight.w600),
          ),
          Row(
            children: List.generate(
                4,
                (index) => InkWell(
                      onTap: () {
                        setState(() {
                          selectedColor = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: index == 3
                            ? EdgeInsets.zero
                            : EdgeInsets.only(right: SizeUtils.getWidth(16)),
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeUtils.getWidth(8)),
                        height: SizeUtils.getHeight(32),
                        width: SizeUtils.getHeight(32),
                        decoration: BoxDecoration(
                            color: colors[index], shape: BoxShape.circle),
                        child: selectedColor == index
                            ? SvgPicture.asset(
                                Utils.getAssetSvg("ic_tick"),
                                height: SizeUtils.getHeight(16),
                              )
                            : verticalSpace(0),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  Widget sizeSelector() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "SIZE",
            style: FontUtils.getFont16Style(
                color: AppColors.mattBlack, fontWeight: FontWeight.w600),
          ),
          Row(
            children: List.generate(
                4,
                (index) => InkWell(
                      onTap: () {
                        setState(() {
                          selectedSize = index;
                        });
                      },
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: const Duration(milliseconds: 250),
                        margin: index == 3
                            ? EdgeInsets.zero
                            : EdgeInsets.only(right: SizeUtils.getWidth(16)),
                        height: SizeUtils.getHeight(32),
                        width: SizeUtils.getHeight(32),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(SizeUtils.getRadius(8)),
                            border: Border.all(
                                width: SizeUtils.getWidth(2),
                                color: selectedSize == index
                                    ? AppColors.linearyellow1
                                    : AppColors.sizeBorder),
                            color: selectedSize == index
                                ? AppColors.linearyellow1
                                : AppColors.white,
                            shape: BoxShape.rectangle),
                        child: Text(
                          size[index],
                          maxLines: 1,
                          style: FontUtils.getFont16Style(
                              color: selectedSize == index
                                  ? AppColors.mattBlack
                                  : AppColors.sizeBorder,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  Widget dividerLine() {
    return Divider(
      color: AppColors.black.withOpacity(0.2),
    );
  }

  // price selector
  Widget priceSlider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      height: SizeUtils.getHeight(90),
      width: SizeUtils.getScreenWidth(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose your price range",
            style: FontUtils.getFont16Style(
                color: AppColors.black, fontWeight: FontWeight.w400),
          ),
          verticalSpace(40),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                overlayShape: RoundSliderOverlayShape(
                    overlayRadius: SizeUtils.getRadius(10)),
                thumbShape: RoundSliderThumbShape(
                    pressedElevation: 2,
                    elevation: 0,
                    enabledThumbRadius: SizeUtils.getRadius(24)),
                minThumbSeparation: SizeUtils.getWidth(350),
                // showValueIndicator: ,
                valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                valueIndicatorTextStyle: FontUtils.getFont12Style(
                    color: AppColors.fontGrey, fontWeight: FontWeight.w500),
                valueIndicatorColor: AppColors.transparent,
                overlayColor: AppColors.white,
                inactiveTrackColor: AppColors.radioBtn,
                activeTrackColor: AppColors.lightpink,
                thumbColor: AppColors.lightpink),
            child: RangeSlider(
                divisions: 2000,
                semanticFormatterCallback: (value) {
                  return value.toString();
                },
                labels: RangeLabels(
                    "₹${_startValue.toInt()}", "₹${_endValue.toInt()}"),
                min: 0,
                max: 2000,
                values: RangeValues(_startValue, _endValue),
                onChangeEnd: (values) {
                  _startValue = values.start;
                  _endValue = values.end;
                },
                onChanged: (values) {
                  setState(() {
                    _startValue = values.start;
                    _endValue = values.end;
                  });
                }),
          )
        ],
      ),
    );
  }

  // AGE SELECTOR
  Widget ageSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeUtils.getWidth(24)),
          child: Text(
            'Kids Age',
            style: FontUtils.getFont16Style(
                color: AppColors.black, fontWeight: FontWeight.w400),
          ),
        ),
        verticalSpace(12),
        SizedBox(
          height: SizeUtils.getHeight(28),
          width: SizeUtils.getScreenWidth(),
          child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: SizeUtils.getWidth(16)),
                  child: ageDetail(index),
                );
              }),
        )
      ],
    );
  }

  Widget ageDetail(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          if (ageSelected.contains(filterAges[index])) {
            ageSelected.remove(filterAges[index]);
          } else {
            ageSelected.add(filterAges[index]);
          }
        });
      },
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: SizeUtils.getHeight(24),
            width: SizeUtils.getHeight(24),
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(7)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
              color: ageSelected.contains(filterAges[index])
                  ? AppColors.lightpink.withOpacity(0.2)
                  : AppColors.radioBtn, /*  shape: BoxShape.circle */
            ),
            child: ageSelected.contains(filterAges[index])
                ? const DecoratedBox(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.lightpink),
                  )
                : verticalSpace(0),
          ),
          horizontalSpace(8),
          Text(
            filterAges[index],
            style: FontUtils.getFont16Style(
                color: AppColors.fontGrey, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Widget selecteQuality() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectQTy = 0;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: SizeUtils.getHeight(48),
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(60)),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: selectQTy == 0
                          ? AppColors.primaryColor
                          : AppColors.qtyBorder,
                      width: SizeUtils.getWidth(1.5)),
                  color: selectQTy == 0
                      ? AppColors.lightGrey.withOpacity(0.2)
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(4))),
              child: SvgPicture.asset(
                Utils.getAssetSvg("isi_mark"),
                color: AppColors.fontGrey,
                height: SizeUtils.getHeight(24),
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                selectQTy = 1;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              alignment: Alignment.center,
              height: SizeUtils.getHeight(48),
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(43)),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: selectQTy == 1
                          ? AppColors.primaryColor
                          : AppColors.qtyBorder,
                      width: SizeUtils.getWidth(1.5)),
                  color: selectQTy == 1
                      ? AppColors.lightGrey.withOpacity(0.2)
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(4))),
              child: Text("Premium",
                  style: FontUtils.getFont16Style(
                      color: AppColors.fontGrey, fontWeight: FontWeight.w500)),
            ),
          )
        ],
      ),
    );
  }

  Widget sortbyPrice() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      width: SizeUtils.getWidth(180),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedSort = 0;
              });
            },
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: SizeUtils.getHeight(24),
                  width: SizeUtils.getHeight(24),
                  padding:
                      EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(7)),
                  decoration: BoxDecoration(
                      color: selectedSort == 0
                          ? AppColors.lightpink.withOpacity(0.2)
                          : AppColors.radioBtn,
                      shape: BoxShape.circle),
                  child: selectedSort == 0
                      ? const DecoratedBox(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightpink),
                        )
                      : verticalSpace(0),
                ),
                horizontalSpace(8),
                Text(
                  "Price: Low to high",
                  style: FontUtils.getFont16Style(
                      color: AppColors.fontGrey, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          verticalSpace(8),
          InkWell(
            onTap: () {
              setState(() {
                selectedSort = 1;
              });
            },
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: SizeUtils.getHeight(24),
                  width: SizeUtils.getHeight(24),
                  padding:
                      EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(7)),
                  decoration: BoxDecoration(
                      color: selectedSort == 1
                          ? AppColors.lightpink.withOpacity(0.2)
                          : AppColors.radioBtn,
                      shape: BoxShape.circle),
                  child: selectedSort == 1
                      ? const DecoratedBox(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightpink),
                        )
                      : verticalSpace(0),
                ),
                horizontalSpace(8),
                Text(
                  "Price: Low to high",
                  style: FontUtils.getFont16Style(
                      color: AppColors.fontGrey, fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget applybtn() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Filter",
            style: FontUtils.getFont24Style(
                color: AppColors.black, fontWeight: FontWeight.w500),
          ),
          // apply btn
          Container(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(14)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(25)),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.linearPink1,
                      AppColors.linearPink2,
                    ])),
            height: SizeUtils.getHeight(32),
            child: TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColors.transparent),
              child: Text(
                "Apply",
                style: FontUtils.getFont16Style(color: AppColors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
          // apply btn
        ],
      ),
    );
  }
}
