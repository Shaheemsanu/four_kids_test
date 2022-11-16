import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/view/login_screen/login_screen.dart';

import '../../view/admin_approval_screen/admin_approval_screen.dart';
import '../../view/bottom_nav_screen/bottom_nav_screen.dart';
import '../../view/category_screen/category_screen.dart';
import '../../view/company_registration_screen/company_registration_screen.dart';
import '../../view/doc_upload_screen/doc_upload_screen.dart';
import '../../view/faq_screen/faq_screen.dart';
import '../../view/my_account_screen/my_account_screen.dart';
import '../../view/onboarding_screen/onboarding_screen.dart';
import '../../view/order_detail_screen/order_detail_screen.dart';
import '../../view/order_history_screen/order_history_screen.dart';
import '../../view/otp_screen/otp_screen.dart';
import '../../view/product_detail_screen/product_detail_screen.dart';
import '../../view/product_listing_screen/product_listing_screen.dart';
import '../../view/register_location_screen/register_location_screen.dart';
import '../../view/register_screen/register_screen.dart';
import '../../view/splash_screen/splash_screen.dart';
import '../../view/store_screen/store_screen.dart';
import '../../view/sub_category_screen/sub_category_screen.dart';
import '../../view/success_screen/success_screen.dart';
import '../../view/welcome_screen/welcome_screen.dart';
import '../widgets/show_toast.dart';

class CommonNavigate {
  CommonNavigate({required this.parentContext});
  final BuildContext parentContext;

  navigateSplashScreen() {
    Navigator.push(
      parentContext,
      MaterialPageRoute(builder: (context) => const SplashScreen()),
    );
  }

  navigateWelcomeScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }

  navigateOnBoaringScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()));
  }

  navigateLoginScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  navigateOtpScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const OtpScreen()));
  }

  navigateRegisterLocationScreen() {
    Navigator.pushReplacement(
        parentContext,
        MaterialPageRoute(
            builder: (context) => const RegisterLocationScreen()));
  }

  navigateRegisterScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }

  navigateDocUploadScreen(bool isGst) {
    Navigator.push(
        parentContext,
        MaterialPageRoute(
            builder: (context) => DocUploadScreen(
                  isGST: isGst,
                )));
  }

  navigateAdminApprovalScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const AdminApprovalScreen()));
  }

  navigateHomeScreen() {
    Navigator.pushReplacement(
        parentContext,
        MaterialPageRoute(
            builder: (context) => const BottomNavScreen(selectedIndex: 0)));
  }

  navigateCategoryScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const CategoryScreen()));
  }

  navigateSubCategoryScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const SubCategoryScreen()));
  }

  navigateProductListingScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const ProductListingScreen()));
  }

  navigateProductDetailScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const ProductDetailScreen()));
  }

  navigateCartScreen() {
    Navigator.push(
        parentContext,
        MaterialPageRoute(
            builder: (context) => const BottomNavScreen(
                  selectedIndex: 2,
                )));
  }

  navigateShopScreen() {
    Navigator.pushReplacement(
        parentContext,
        MaterialPageRoute(
            builder: ((context) => const BottomNavScreen(selectedIndex: 1))));
  }

  navigateSuccessScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const SuccessScreen()));
  }

  navigateMyAccountScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const MyAccountScreen()));
  }

  navigateProfileScreen() {
    Navigator.pushReplacement(
        parentContext,
        MaterialPageRoute(
            builder: (context) => const BottomNavScreen(selectedIndex: 3)));
  }

  navigateOrderHistoryScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const OrderHistoryScreen()));
  }

  navigateOrderDetailScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const OrderDetailScreen()));
  }

  navigateFaqScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const FAQScreen()));
  }

  navigateCompanyRegistrationScreen() {
    Navigator.push(
        parentContext,
        MaterialPageRoute(
            builder: (context) => const CompanyRegistrationScreen()));
  }

  navigateStoreScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const StoreScreen()));
  }

  navigateServerError() {
    ShowToast(
      message: "Server Error",
      parentContext: parentContext,
      title: "Error",
    ).show();
  }

  navigateNoInternet() {
    ShowToast(
      message: "No Internet",
      parentContext: parentContext,
      title: "Error",
    ).show();
  }
}
