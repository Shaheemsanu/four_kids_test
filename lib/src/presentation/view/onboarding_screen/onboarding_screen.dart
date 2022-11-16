import 'package:flutter/material.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/widgets/custom_back_btn.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/footer_button.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  final PageController _imageController =
      PageController(initialPage: 0, keepPage: true);

  int currentPage = 0;
  List<String> pageImage = ["onboarding1", "onboarding2", "onboarding3"];
  List<String> greetTitle = [
    "PICK THE BEST",
    "A MOMENTS OF PLAY",
    "CHILD'S PARADISE"
  ];
  List<String> title = [
    "Every Toys have Spirit of Joy",
    "The best place for kids toys",
    "The best toy cares for your child"
  ];
  List<String> description = [
    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam",
    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam",
    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam"
  ];

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _imageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: SizedBox(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            child: Stack(
              children: [
                Align(alignment: Alignment.topCenter, child: imagePageView()),
                Align(
                    alignment: Alignment.bottomCenter, child: contentSlider()),
                backButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget backButton() {
    return currentPage == 0
        ? const SizedBox()
        : Padding(
            padding: EdgeInsets.only(
                top: SizeUtils.getHeight(24), left: SizeUtils.getWidth(24)),
            child: CustomBackButton(
              onTap: () {
                setState(() {
                  currentPage--;
                });
                _pageController.animateToPage(currentPage,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);

                _imageController.animateToPage(currentPage,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
              },
            ),
          );
  }

  Widget imagePageView() {
    return SizedBox(
      height: SizeUtils.getHeight(375),
      width: SizeUtils.getScreenWidth(),
      child: PageView.builder(
          controller: _imageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            currentPage = index;
          },
          itemBuilder: (context, index) {
            return Image.asset(
              Utils.getAssetPng(pageImage[index]),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            );
          }),
    );
  }

  Widget contentSlider() {
    return Container(
      height: SizeUtils.getHeight(460),
      width: SizeUtils.getScreenWidth(),
      decoration: BoxDecoration(
          image: DecorationImage( 
              image: AssetImage(Utils.getAssetPng('onboaring_bg')),
              alignment: Alignment.topCenter,
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          contentPageView(),
          verticalSpace(35),
          footerRow(),
          verticalSpace(24)
        ],
      ),
    );
  }

  Widget contentPageView() {
    return Flexible(
        // height: SizeUtils.getHeight(210),
        // width: SizeUtils.getScreenWidth(),
        child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greetTitle[index],
                      maxLines: 1,
                      style: FontUtils.getFont14Style(
                          letterSpacing: SizeUtils.getWidth(3.5),
                          color: AppColors.fontGrey,
                          fontWeight: FontWeight.w600),
                    ),
                    verticalSpace(4),
                    Text(
                      title[index],
                      maxLines: 2,
                      style:
                          FontUtils.getFont32Style(fontWeight: FontWeight.w500),
                    ),
                    verticalSpace(24),
                    Text(
                      description[index],
                      maxLines: 3,
                      style: FontUtils.getFont16Style(
                          color: AppColors.darkGrey,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              );
            })));
  }

  Widget footerRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: currentPage == 2
          ? FooterButton(
              label: "Get Started",
              onTap: () {
                CommonNavigate(parentContext: context).navigateLoginScreen();
              })
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        text: "0${currentPage + 1} ",
                        style: FontUtils.getFont16Style(
                            color: AppColors.fontGrey,
                            fontWeight: FontWeight.w500),
                        children: [
                      TextSpan(
                          text: "/ 03",
                          style: FontUtils.getFont16Style(
                              color: AppColors.lightGrey,
                              fontWeight: FontWeight.w500))
                    ])),
                FooterButton(
                    width: SizeUtils.getWidth(123),
                    label: "Next",
                    onTap: () {
                      setState(() {
                        if (currentPage < 2) {
                          currentPage++;
                        }
                      });
                      _pageController.animateToPage(currentPage,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);

                      _imageController.animateToPage(currentPage,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    })
              ],
            ),
    );
  }
}
