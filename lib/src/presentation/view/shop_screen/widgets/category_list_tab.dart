import 'package:flutter/material.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';

class CategoryListTab extends StatefulWidget {
  const CategoryListTab({Key? key}) : super(key: key);

  @override
  State<CategoryListTab> createState() => _CategoryListTabState();
}

class _CategoryListTabState extends State<CategoryListTab>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  List<String> categoryTitle = [
    "Baby Gear",
    "Toys",
    "New Born",
    "Indoor",
    "Decorations",
    "Footwear",
    "Bags",
    "Apparels"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
        animationDuration: const Duration(milliseconds: 300),
        length: categoryTitle.length,
        vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.getHeight(30),
      width: SizeUtils.getScreenWidth(),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 4,
        isScrollable: true,
        unselectedLabelColor: AppColors.black,
        labelColor: AppColors.black,
        onTap: (value) {
          setState(() {});
        },
        labelStyle: FontUtils.getFont16Style(
            color: AppColors.black, fontWeight: FontWeight.w500),
        indicatorColor: AppColors.lightpink,
        padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
        controller: _tabController,
        unselectedLabelStyle: FontUtils.getFont14Style(
            color: AppColors.black, fontWeight: FontWeight.w500),
        tabs: List.generate(
            categoryTitle.length,
            (index) => Tab(
                  child: Text(
                    categoryTitle[index],
                    style: _tabController.index == index
                        ? FontUtils.getFont18Style(
                            color: AppColors.black, fontWeight: FontWeight.w500)
                        : FontUtils.getFont14Style(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                  ),
                )),
      ),
    );
  }
}
