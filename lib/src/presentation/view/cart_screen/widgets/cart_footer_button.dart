import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constants/common_navigate.dart';
import '../../../core/widgets/footer_button.dart';

class CartFooterButton extends StatelessWidget {
  const CartFooterButton({super.key});

  @override
  Widget build(BuildContext context) {
   return FooterButton(
        label: "Proceed to CheckOut",
        onTap: () {
          CommonNavigate(parentContext: context).navigateSuccessScreen();
        });
  }
}