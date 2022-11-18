const baseUrl = 'http://staging-servers.com/4kids/';

const checkServer = '${baseUrl}api/v1/customer/check_server';
const loginCheckPhone = '${baseUrl}api/v1/customer/login_check_phone';
const loginVerifyOtp = '${baseUrl}api/v1/customer/login_verify_otp';
const getHomeData = '${baseUrl}api/v1/customer/get_home_data';
const updateProfilLocation =
    '${baseUrl}api/v1/customer/update_profile_location';
const createNewAc = '${baseUrl}api/v1/customer/create_new_ac';
const validatePhoneNumber = '${baseUrl}api/v1/customer/validate_phone_number';
const updateProfile = '${baseUrl}api/v1/customer/update_profile';
const getCustomerAddress = '${baseUrl}api/v1/customer/get_customer_address';
const insertCustomerAddress =
    '${baseUrl}api/v1/customer/insert_customer_address';
const deleteCustomerAddress =
    '${baseUrl}api/v1/customer/delete_customer_address';
const selectAddress = '${baseUrl}api/v1/customer/select_address';
const getProductData = '${baseUrl}api/v1/customer/get_product_data';
const insertCartData = '${baseUrl}api/v1/customer/insert_cart_data';
const insertOrderData = '${baseUrl}api/v1/customer/insert_order_data';
const getCartData = '${baseUrl}api/v1/customer/get_cart_data';
const clearCartData = '${baseUrl}api/v1/customer/clear_cart_data';
const resetCartData = '${baseUrl}api/v1/customer/reset_cart_data';
const getBannersData = '${baseUrl}api/v1/customer/get_banners_data';
const getSeliveryCharge = '${baseUrl}api/v1/customer/get_delivery_charge';
const getProductRatings = '${baseUrl}api/v1/customer/get_product_ratings';
const getOrderData = '${baseUrl}api/v1/customer/get_order_data';
const reportOrderProduct = '${baseUrl}api/v1/customer/report_order_product';
const reviewOrder = '${baseUrl}api/v1/customer/review_order';
const validatePromocode = '${baseUrl}api/v1/customer/validate_promocode';
const cancelOrder = '${baseUrl}api/v1/customer/cancel_order';
const logout = '${baseUrl}api/v1/customer/logout';
const sendCompanyRequest = '${baseUrl}api/v1/customer/send_company_request';
const sendBranchRequest = '${baseUrl}api/v1/customer/send_branch_request';
const deleteBranch = '${baseUrl}api/v1/customer/delete_branch';
const getBranches = '${baseUrl}api/v1/customer/get_branches';
const selectBranch = '${baseUrl}api/v1/customer/select_branch';
const getProductDetails = '${baseUrl}api/v1/customer/get_product_details';
const getCategoryBannerSubData =
    '${baseUrl}api/v1/customer/get_category_banner_sub_data';
const repeatOrderSet = '${baseUrl}api/v1/customer/repeat_order_set';
const updateProfileImage = '${baseUrl}api/v1/customer/update_profile_image';
