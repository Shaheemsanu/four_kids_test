import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/common_navigate.dart';
import '../../core/constants/form_validators.dart';
import '../../core/theme/scroll_behaviour.dart';
import '../../core/theme/size_utils.dart';
import '../../core/theme/utils.dart';
import '../../core/widgets/custom_back_btn.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/custom_textfield.dart';
import '../../core/widgets/footer_button.dart';
import 'doc_upload_view.dart';

class DocUploadScreen extends StatefulWidget {
  final bool isGST;
  const DocUploadScreen({Key? key, required this.isGST}) : super(key: key);

  @override
  State<DocUploadScreen> createState() => _DocUploadScreenState();
}

class _DocUploadScreenState extends State<DocUploadScreen> {
  bool isKeyboardVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _gstController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();

  bool autoFocus = true;
  bool isGst = true;

  String frontImage = "";
  String backImage = "";

  String gstDoc = "";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _gstController.dispose();
    _aadhaarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: Form(
            key: _formKey,
            child: Container(
              height: SizeUtils.getScreenHeight(),
              width: SizeUtils.getScreenWidth(),
              padding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(24),
                horizontal: SizeUtils.getWidth(24),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        Utils.getAssetPng("bg"),
                      ),
                      fit: BoxFit.cover)),
              child: widget.isGST
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appBar(),
                          verticalSpace(24),
                          // const Spacer(),
                          /*  SizedBox(
                          height: SizeUtils.getHeight(100),
                          width: SizeUtils.getScreenWidth(),
                          child: SvgPicture.asset(Utils.getAssetSvg("gst_image")),
                        ), */
                          // verticalSpace(32),
                          Text(
                            "Enter your GST Number for Verification",
                            style: FontUtils.getFont14Style(
                                color: AppColors.fontGrey,
                                fontWeight: FontWeight.w500),
                          ),
                          verticalSpace(8),
                          gstTextField(),
                          verticalSpace(32),
                          Text(
                            "Upload your GST certificate",
                            style: FontUtils.getFont14Style(
                                color: AppColors.fontGrey,
                                fontWeight: FontWeight.w500),
                          ),
                          verticalSpace(16),
                          DocUploadView(
                              getImage: (value) {
                                gstDoc = value;
                              },
                              text: "Upload GST Certificate"),
                          isKeyboardVisible
                              ? verticalSpace(24)
                              : verticalSpace(160),
                          footerButton(),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          verticalSpace(24),
                          appBar(),
                          verticalSpace(24),
                          aadharCardField(),
                          verticalSpace(120),
                          footerButton(),
                          verticalSpace(24)
                        ],
                      ),
                    ),
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
          "Document Submission",
          // widget.isGST ? "Enter GST number" : "Upload Aadhaar card",
          textAlign: TextAlign.center,
          style: FontUtils.getFont18Style(
              color: AppColors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget gstTextField() {
    return CustomTextField(
      maxLength: 15,
      label: "GST Number",
      controller: _gstController,
      validator: (value) {
        return FormValidators.emptyValidate(value);
      },
      autoFocus: true,
      textCapitalization: TextCapitalization.characters,
    );
  }

  Widget footerButton() {
    return widget.isGST
        ? FooterButton(
            label: "Submit",
            onTap: () {
              // if (_formKey.currentState!.validate()) {
              CompanyRegistrationSuccess(parentContext: context)
                  .show(); // CommonNavigate(parentContext: context).navigateAdminApprovalScreen();
              // }
            })
        : FooterButton(
            label: "Submit",
            onTap: () {
              CompanyRegistrationSuccess(parentContext: context).show();
              /*  if (_formKey.currentState!.validate() &&
                  frontImage != "" &&
                  backImage != "") { */
              // CommonNavigate(parentContext: context).navigateAdminApprovalScreen();
              /*  } else {
                ShowToast(
                        title: "",
                        message: "Upload Aadhaar Card",
                        parentContext: context)
                    .show();
              } */
            });
  }

  Widget aadharCardField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        aadharCardTextField(),
        verticalSpace(16),
        Text(
          "In case of E-Aadhaar, upload same copy for both front & back",
          style: FontUtils.getFont14Style(
              color: AppColors.fontGrey, fontWeight: FontWeight.w500),
        ),
        verticalSpace(32),
        DocUploadView(
            text: "Upload Aadhaar Front image",
            getImage: (value) {
              frontImage = value;
            }),
        verticalSpace(24),
        DocUploadView(
          text: "Upload Aadhaar Back Image",
          getImage: (value) {
            backImage = value;
          },
        )
      ],
    );
  }

  Widget aadharCardTextField() {
    return CustomTextField(
      label: "Aadhaar card No.",
      controller: _aadhaarController,
      autoFocus: true,
      keyboardType: TextInputType.number,
      validator: (value) {
        return FormValidators.emptyValidate(value);
      },
      inputFormatter: [CardFormatter(sample: "xxxx xxxx xxxx", seperator: " ")],
    );
  }
}

// aadhaar digits formatting class
class CardFormatter extends TextInputFormatter {
  final String seperator;
  final String sample;

  CardFormatter({required this.sample, required this.seperator}) {
    assert(sample.isNotEmpty);
    assert(seperator.isNotEmpty);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > sample.length) return oldValue;
        if (newValue.text.length < sample.length &&
            sample[newValue.text.length - 1] == seperator) {
          return TextEditingValue(
              text:
                  '${oldValue.text}$seperator${newValue.text.substring(newValue.text.length - 1)}',
              selection:
                  TextSelection.collapsed(offset: newValue.selection.end + 1));
        }
      }
    }
    return newValue;
  }
}

class CompanyRegistrationSuccess {
  final BuildContext parentContext;
  CompanyRegistrationSuccess({required this.parentContext});

  show() {
    showDialog(
        barrierDismissible: false,
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeUtils.getWidth(24),
                vertical: SizeUtils.getHeight(24)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(15))),
            children: [
              SizedBox(
                height: SizeUtils.getHeight(130),
                width: SizeUtils.getHeight(130),
                child: Lottie.asset(Utils.getAssetLottie("business_registered"),
                    animate: true,
                    alignment: Alignment.center,
                    repeat: false,
                    fit: BoxFit.contain),
              ),
              verticalSpace(16),
              Text(
                "Company registered successfully",
                textAlign: TextAlign.center,
                style: FontUtils.getFont20Style(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w500),
              ),
              verticalSpace(24),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(16)),
                child: Text(
                  "Your Registration is under verification, we will notify you once the verification is completed.",
                  textAlign: TextAlign.center,
                  style: FontUtils.getFont14Style(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                ),
              ),
              verticalSpace(24),
              FooterButton(
                  label: "Home",
                  onTap: () {
                    CommonNavigate(parentContext: context).navigateHomeScreen();
                  })
            ],
          );
        });
  }
}
