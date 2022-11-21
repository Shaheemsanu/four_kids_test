/* import 'package:fourkids/utility/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fourkids/utility/values/font_utils.dart';
import 'package:fourkids/utility/values/size_utils.dart';
import 'package:fourkids/utility/values/utils.dart';

class CustomDropDown extends StatefulWidget {
  final Function(String) onChanged;
  final String selectedValue;
  const CustomDropDown(
      {Key? key, required this.onChanged, required this.selectedValue})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String dropdownValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(

      hint: Text("Select zone",
          style: FontUtils.getFont12Style(
              color: AppColors.grey, fontWeight: FontWeight.w400)),
      menuMaxHeight: SizeUtils.getHeight(270),
      isExpanded: true,
      iconEnabledColor: AppColors.bordergrey,
      borderRadius: BorderRadius.circular(SizeUtils.getRadius(15)),
      value: dropdownValue == "" ? null : dropdownValue,
      icon: SvgPicture.asset(
        Utils.getAssetSvg("dropdown"),
        fit: BoxFit.cover,
        color: AppColors.icongrey,
      ),
      iconSize: SizeUtils.getHeight(16),
      alignment: Alignment.center,
      underline: Container(
        color: AppColors.white,
      ),
      style: FontUtils.getFont12Style(color: AppColors.black),
      items:  List<DropdownMenuItem> [] ,
      /* widget.items.map<DropdownMenuItem<String>>((ZoneModel value) {
        return DropdownMenuItem<String>(
          value: value.id!.toString(),
          child: Text(
            value.name!,
            style: FontUtils.getFont12Style(color: AppColors.icongrey),
          ),
        );
      }).toList(), */
      onChanged: (value) {

      } ,
    );
  }
}
 */
