import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constants/common_navigate.dart';
import '../../../core/widgets/footer_button.dart';

class WelcomeFooterButton extends StatelessWidget {
  const WelcomeFooterButton({super.key});

  @override
  Widget build(BuildContext context) {
  return FooterButton(
        label: "Let’s Start",
        onTap: () {
          CommonNavigate(parentContext: context).navigateOnBoaringScreen();
        });
  }
}