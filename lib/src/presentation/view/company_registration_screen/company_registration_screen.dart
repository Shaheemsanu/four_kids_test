import 'package:flutter/material.dart';
import '../../core/constants/form_validators.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/widgets/custom_back_btn.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/custom_textfield.dart';
import '../../core/widgets/footer_button.dart';
import 'identity_card_dialogbox.dart';

class CompanyRegistrationScreen extends StatefulWidget {
  const CompanyRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<CompanyRegistrationScreen> createState() =>
      _CompanyRegistrationScreenState();
}

class _CompanyRegistrationScreenState extends State<CompanyRegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isAdded = ValueNotifier<bool>(false);
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _additionalNumber = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _companyController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _whatsappController.dispose();
    _addressController.dispose();
    _additionalNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            padding: EdgeInsets.only(
                left: SizeUtils.getWidth(24),
                right: SizeUtils.getWidth(24),
                top: SizeUtils.getHeight(24)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Utils.getAssetPng("bg")),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                title(),
                verticalSpace(24),
                ScrollConfiguration(
                    behavior: NoGlowScrollBehaviour(),
                    child: Flexible(
                      child: ListView(
                        children: [
                          companyName(), // company name
                          verticalSpace(12),
                          contactPerson(), // contact person
                          verticalSpace(12),
                          mobileNumber(), // mobile number
                          verticalSpace(12),
                          additionalNumberSelection(),
                          whatsappNumber(), // whatsapp number
                          verticalSpace(12),
                          email(), // email
                          verticalSpace(12),
                          address(), // address
                          verticalSpace(16),
                          FooterButton(
                              label: "Register",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return const IdentityCardDialogBox();
                                      });
                                  // CommonNavigate(parentContext: context).navigateDocUploadScreen();
                                }
                              }),
                          verticalSpace(24),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget companyName() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      label: "Company Name",
      controller: _companyController,
      validator: (value) {
        return FormValidators.emptyValidate(value);
      },
    );
  }

  Widget contactPerson() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      label: "Contact Person",
      controller: _fullNameController,
      validator: (value) {
        return FormValidators.emptyValidate(value);
      },
    );
  }

  Widget email() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      label: "Email",
      controller: _emailController,
      validator: (value) {
        return FormValidators.emailValidate(value);
      },
    );
  }

  Widget mobileNumber() {
    return CustomTextField(
      label: "Mobile Number",
      controller: _mobileController,
      maxLength: 10,
      keyboardType: TextInputType.number,
      onFieldSubmitted: (value) {
        _whatsappController.text = value;
      },
      validator: (value) {
        return FormValidators.phoneValidate(value);
      },
    );
  }

  Widget whatsappNumber() {
    return CustomTextField(
      label: "Whatsapp Number",
      maxLength: 10,
      controller: _whatsappController,
      keyboardType: TextInputType.number,
      onTap: () {
        if (_whatsappController.text.isEmpty) {
          _whatsappController.text = _mobileController.text;
        }
      },
      validator: (value) {
        return FormValidators.phoneValidate(value);
      },
    );
  }

  Widget phoneNumber() {
    return CustomTextField(
      label: "Additional Number",
      controller: _additionalNumber,
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (value) {
        return FormValidators.phoneValidate(value);
      },
    );
  }

  Widget address() {
    return CustomTextField(
      label: "Address",
      maxLines: 3,
      controller: _addressController,
      validator: (value) {
        return FormValidators.emptyValidate(value);
      },
    );
  }

  Widget title() {
    return SizedBox(
      width: SizeUtils.getScreenWidth(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CustomBackButton(
            color: AppColors.transparent,
          ),
          const Spacer(),
          Text(
            "Company Registration",
            textAlign: TextAlign.center,
            style: FontUtils.getFont18Style(
                color: AppColors.black, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget additionalNumberSelection() {
    return ValueListenableBuilder<bool>(
        valueListenable: isAdded,
        builder: (context, value, child) {
          if (value) {
            return Column(
              children: [verticalSpace(6), phoneNumber(), verticalSpace(12)],
            );
          } else {
            return Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: SizeUtils.getHeight(24),
                width: SizeUtils.getHeight(24),
                child: TextButton(
                  style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      backgroundColor: AppColors.primaryColor),
                  child: Icon(Icons.add,
                      color: AppColors.white, size: SizeUtils.getHeight(20)),
                  onPressed: () {
                    isAdded.value = true;
                  },
                ),
              ),
            );
          }
        });
  }
}
