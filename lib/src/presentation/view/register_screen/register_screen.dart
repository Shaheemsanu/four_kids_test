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
import '../admin_approval_screen/register_success_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isKeyBoardVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _contactPersonController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _companyController.dispose();
    _contactPersonController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _whatsappController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isKeyBoardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.getWidth(24),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Utils.getAssetPng("bg")),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                verticalSpace(24),
                appBar(),
                verticalSpace(24),
                ScrollConfiguration(
                  behavior: NoGlowScrollBehaviour(),
                  child: Flexible(
                    child: ListView(
                      primary: true,
                      children: [
                        fullName(), // company name
                        verticalSpace(12),
                        // contactPerson(), // contact person
                        // verticalSpace(12),
                        mobileNumber(), // mobile number
                        verticalSpace(12),
                        whatsappNumber(), // whatsapp number
                        verticalSpace(12),
                        email(), // email
                        verticalSpace(12),
                        address(), // address
                        isKeyBoardVisible
                            ? verticalSpace(18)
                            : verticalSpace(60),
                        footerButton(), // footerbtn,
                        verticalSpace(24)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        const CustomBackButton(),
        horizontalSpace(45),
        Text(
          "Create new account",
          textAlign: TextAlign.center,
          style: FontUtils.getFont18Style(
              color: AppColors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget fullName() {
    return CustomTextField(
      label: "Full Name",
      keyboardType: TextInputType.text,
      controller: _companyController,
      validator: (value) {
        return FormValidators.emptyValidate(value);
      },
    );
  }

  Widget contactPerson() {
    return CustomTextField(
      label: "Contact Person",
      keyboardType: TextInputType.name,
      controller: _contactPersonController,
      validator: (value) {
        return FormValidators.nameValidate(value);
      },
    );
  }

  Widget email() {
    return CustomTextField(
      label: "Email",
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      controller: _emailController,
      validator: (value) {
        return FormValidators.emailValidate(value);
      },
    );
  }

  Widget mobileNumber() {
    return CustomTextField(
      maxLength: 10,
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
      maxLength: 10,
      onTap: () {
        if (_whatsappController.text.isEmpty) {
          _whatsappController.text = _mobileController.text;
        }
      },
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
      maxLines: 3,
      controller: _addressController,
      validator: (value) {
        return FormValidators.emptyValidate(value);
      },
    );
  }

  Widget footerButton() {
    return FooterButton(
        label: "Next",
        onTap: () {
          if (_formKey.currentState!.validate()) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return const RegisterSuccessDialog();
                });
          }
        });
  }
}
