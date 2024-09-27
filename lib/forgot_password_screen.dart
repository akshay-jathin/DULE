import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool isOtpVisible = false;

  void _handleButtonPress() {
    if (isOtpVisible) {
      // Navigate to the home page when OTP field is visible and Submit button is pressed
      Navigator.pushNamed(context, '/home');
    } else {
      // Show OTP field when Generate OTP button is pressed
      setState(() {
        isOtpVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 24,
                top: 10,
                right: 24,
              ),
              child: Column(
                children: [
                  SizedBox(height: 78),
                  Image.asset(
                    "assets/images/Dule_Logo-removebg-preview 2.png",
                    height: 124,
                    width: 118,
                  ),
                  SizedBox(height: 18),
                  Text(
                    "Forgot password",
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 25,
                      fontFamily: 'Heebo',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildPhoneNumberInputSection(context),
                  if (isOtpVisible) ...[
                    SizedBox(height: 22),
                    _buildOtpInputSection(),
                  ],
                  SizedBox(height: 22),
                  SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0XFF0386D0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        visualDensity: const VisualDensity(
                          vertical: -4,
                          horizontal: -4,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 8,
                        ),
                      ),
                      onPressed: _handleButtonPress,
                      child: Text(
                        isOtpVisible ? "Submit" : "Generate OTP",
                        style: TextStyle(
                          color: Color(0XFFF5F5F5),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 378),
                  SizedBox(
                    width: 108,
                    child: Divider(
                      height: 4,
                      thickness: 4,
                      color: Color(0XFF1D1B20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberInputSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter your phone number",
            style: TextStyle(
              color: Color(0XFF1E1E1E),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 360,
            child: TextFormField(
              focusNode: FocusNode(),
              autofocus: true,
              controller: phoneNumberController,
              style: TextStyle(
                color: Color(0XFFB3B3B3),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "Phone number",
                hintStyle: TextStyle(
                  color: Color(0XFFB3B3B3),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0XFFD9D9D9),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0XFFD9D9D9),
                    width: 1,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0XFFD9D9D9),
                    width: 1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0XFFD9D9D9),
                    width: 1,
                  ),
                ),
                filled: true,
                fillColor: Color(0XFFFFFFFF),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildOtpInputSection() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter the OTP",
            style: TextStyle(
              color: Color(0XFF1E1E1E),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 360,
            child: TextFormField(
              controller: otpController,
              style: TextStyle(
                color: Color(0XFFB3B3B3),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "OTP",
                hintStyle: TextStyle(
                  color: Color(0XFFB3B3B3),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0XFFD9D9D9),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0XFFD9D9D9),
                    width: 1,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0XFFD9D9D9),
                    width: 1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0XFFD9D9D9),
                    width: 1,
                  ),
                ),
                filled: true,
                fillColor: Color(0XFFFFFFFF),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
