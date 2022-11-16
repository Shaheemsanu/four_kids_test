import 'package:flutter/material.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/constants/form_validators.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/widgets/custom_textfield.dart';
import '../../core/widgets/footer_button.dart';
import '../widget/custom_app_bar.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _companyController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _whatsappController.dispose();
    _addressController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Utils.getAssetPng("bg")),
                        fit: BoxFit.cover)),
                height: SizeUtils.getScreenHeight(),
                width: SizeUtils.getScreenWidth(),
                padding: EdgeInsets.only(
                    bottom: SizeUtils.getHeight(24),
                    top: SizeUtils.getHeight(24),
                    right: SizeUtils.getWidth(24),
                    left: SizeUtils.getWidth(24)),
                child: Column(
                  children: [
                    const CustomAppBar(title: "My Account"),
                    ScrollConfiguration(
                      behavior: NoGlowScrollBehaviour(),
                      child: Expanded(
                        child: ListView(
                          primary: true,
                          physics: const ClampingScrollPhysics(),
                          padding: EdgeInsets.only(
                              bottom: SizeUtils.getHeight(24),
                              top: SizeUtils.getHeight(24)),
                          children: [
                            companyName(), // company name
                            verticalSpace(12),
                            contactPerson(), // contact person
                            verticalSpace(12),
                            email(), // email
                            verticalSpace(12),
                            mobileNumber(), // mobile number
                            verticalSpace(12),
                            whatsappNumber(), // whatsapp number
                            verticalSpace(12),
                            address(), // address
                            verticalSpace(24),
                            gstorAadhaar(),
                            verticalSpace(24),
                            pinCode()
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(16),
                    FooterButton(
                        label: "Update Profile",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            CommonNavigate(parentContext: context)
                                .navigateProfileScreen();
                          }
                        }),
                    verticalSpace(12)
                  ],
                )),
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
        return FormValidators.nameValidate(value);
      },
    );
  }

  Widget contactPerson() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      label: "Contact Person",
      controller: _fullNameController,
      validator: (value) {
        return FormValidators.nameValidate(value);
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
      controller: _whatsappController,
      keyboardType: TextInputType.number,
      validator: (value) {
        return FormValidators.phoneValidate(value);
      },
    );
  }

  Widget address() {
    return CustomTextField(
      label: "Address",
      controller: _addressController,
      validator: (value) {
        return FormValidators.emptyValidate(value);
      },
    );
  }

  Widget gstorAadhaar() {
    return CustomTextField(
      label: "GST/Aadhaar",
      validator: (value) {
        return FormValidators.phoneValidate(value);
      },
    );
  }

  Widget pinCode() {
    return CustomTextField(
      label: "Pincode",
      controller: _pincodeController,
      keyboardType: TextInputType.number,
      validator: (value) {
        return FormValidators.defaultValidate(value);
      },
    );
  }
}
