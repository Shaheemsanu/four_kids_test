import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/size_utils.dart';
import '../../../core/theme/typography.dart';

class OrderStatus extends StatelessWidget {
  final String stats;
  const OrderStatus({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(8), vertical: SizeUtils.getHeight(3)),
      decoration: BoxDecoration(
          color: getStatusColor(stats),
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(16))),
      child: Text(
        stats,
        style: FontUtils.getFont10Style(
            color: stats == "Pending" ? AppColors.black : AppColors.white,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Color getStatusColor(String stats) {
    Color statusColor = AppColors.linearyellow1;
    switch (stats) {
      case "Ongoing":
        {
          statusColor = AppColors.lightBlue;
        }
        break;

      case "Delivered":
        {
          statusColor = AppColors.primaryColor;
        }
        break;
    }
    return statusColor;
    /*   Color statusColor = AppColors.linearyellow1;
    if (stats == "Ongoing") {
      statusColor = AppColors.lightBlue;
    } else if (stats == "Delivered") {
      statusColor = AppColors.primaryColor;
    }
    return statusColor; */
  }
}
