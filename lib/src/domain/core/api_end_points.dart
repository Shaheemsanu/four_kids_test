const baseUrl = 'http://staging-servers.com/4kids/';

class ApiEndPoints {
  static const checkServer = '${baseUrl}api/v1/customer/check_server';
  static const loginCheckPhone = '${baseUrl}api/v1/customer/login_check_phone';
  static const loginVerifyOtp = '${baseUrl}api/v1/customer/login_verify_otp';
  static const getHomeData = '${baseUrl}api/v1/customer/get_home_data';
  static const updateProfilLocation =
      '${baseUrl}api/v1/customer/update_profile_location';
  static const createNewAc = '${baseUrl}api/v1/customer/create_new_ac';
  static const validatePhoneNumber =
      '${baseUrl}api/v1/customer/validate_phone_number';
  static const updateProfile = '${baseUrl}api/v1/customer/update_profile';
  static const getCustomerAddress =
      '${baseUrl}api/v1/customer/get_customer_address';
  static const insertCustomerAddress =
      '${baseUrl}api/v1/customer/insert_customer_address';
  static const deleteCustomerAddress =
      '${baseUrl}api/v1/customer/delete_customer_address';
  static const selectAddress = '${baseUrl}api/v1/customer/select_address';
  static const getProductData = '${baseUrl}api/v1/customer/get_product_data';
  static const insertCartData = '${baseUrl}api/v1/customer/insert_cart_data';
  static const insertOrderData = '${baseUrl}api/v1/customer/insert_order_data';
  static const getCartData = '${baseUrl}api/v1/customer/get_cart_data';
  static const clearCartData = '${baseUrl}api/v1/customer/clear_cart_data';
  static const resetCartData = '${baseUrl}api/v1/customer/reset_cart_data';
  static const getBannersData = '${baseUrl}api/v1/customer/get_banners_data';
  static const getSeliveryCharge =
      '${baseUrl}api/v1/customer/get_delivery_charge';
  static const getProductRatings =
      '${baseUrl}api/v1/customer/get_product_ratings';
  static const getOrderData = '${baseUrl}api/v1/customer/get_order_data';
  static const reportOrderProduct =
      '${baseUrl}api/v1/customer/report_order_product';
  static const reviewOrder = '${baseUrl}api/v1/customer/review_order';
  static const validatePromocode =
      '${baseUrl}api/v1/customer/validate_promocode';
  static const cancelOrder = '${baseUrl}api/v1/customer/cancel_order';
  static const logout = '${baseUrl}api/v1/customer/logout';
  static const sendCompanyRequest =
      '${baseUrl}api/v1/customer/send_company_request';
  static const sendBranchRequest =
      '${baseUrl}api/v1/customer/send_branch_request';
  static const deleteBranch = '${baseUrl}api/v1/customer/delete_branch';
  static const getBranches = '${baseUrl}api/v1/customer/get_branches';
  static const selectBranch = '${baseUrl}api/v1/customer/select_branch';
  static const getProductDetails =
      '${baseUrl}api/v1/customer/get_product_details';
  static const getCategoryBannerSubData =
      '${baseUrl}api/v1/customer/get_category_banner_sub_data';
  static const repeatOrderSet = '${baseUrl}api/v1/customer/repeat_order_set';
  static const updateProfileImage =
      '${baseUrl}api/v1/customer/update_profile_image';
}
