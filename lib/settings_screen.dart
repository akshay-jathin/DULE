import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'app_routes.dart';

// ignore_for_file: must_be_immutable
class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController searchController = TextEditingController();

  bool isSelectedSwitch = false;
  bool isSelectedSwitch1 = false;
  bool isSelectedSwitch2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 0),
              decoration: BoxDecoration(
                color: Color(0XFFFFFFFF),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Color(0XFFCAC4D0),
                  width: 8,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 800,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        _buildTopAppBar(context),
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                          decoration: BoxDecoration(
                            color: Color(0XFFFFFFFF),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildNotificationsToggle(context),
                              SizedBox(height: 36),
                              _buildDarkModeToggle(context),
                              SizedBox(height: 36),
                              _buildNotificationsToggleSecondary(context),
                              SizedBox(height: 92),
                              SizedBox(
                                width: double.maxFinite,
                                child: Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Color(0XFFD9D9D9),
                                  indent: 20,
                                  endIndent: 22,
                                ),
                              ),
                              SizedBox(height: 20),
                              _buildAppVersionInfo(context),
                              SizedBox(height: 14),
                              _buildAndroidVersionInfo(context),
                              SizedBox(height:300),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildHandleSection(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

Widget _buildTopAppBar(BuildContext context) {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0XFFA0DEFF), Color(0XFF4091C6)],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            elevation: 0,
            toolbarHeight: 70, // Adjust to your preferred height
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Navigate back to the previous screen
                  },
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset("assets/images/img_arrow_left.svg"),
                  ),
                ),
                SizedBox(width: 12), // Add spacing between the icon and the text
                Text(
                  "Settings",
                  style: TextStyle(
                    color: Color(0XFFFFFFFF),
                    fontSize: 22,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    ),
  );
}

  /// Section Widget
  Widget _buildNotificationsToggle(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Enable notifications",
            style: TextStyle(
              color: Color(0XFF1E1E1E),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          FlutterSwitch(
            value: isSelectedSwitch,
            height: 24,
            width: 40,
            toggleSize: 18,
            borderRadius: 12,
            switchBorder: Border.all(
              color: Color(0XFF2C2C2C),
              width: 1,
            ),
            activeColor: Color(0XFF2C2C2C),
            activeToggleColor: Color(0XFFF5F5F5),
            inactiveColor: Color(0XFFF5F5F5),
            inactiveToggleColor: Color(0XFF2C2C2C),
            onToggle: (value) {
              setState(() {
                isSelectedSwitch = value;
              });
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDarkModeToggle(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Enable dark mode",
            style: TextStyle(
              color: Color(0XFF1E1E1E),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          FlutterSwitch(
            value: isSelectedSwitch1,
            height: 24,
            width: 40,
            toggleSize: 18,
            borderRadius: 12,
            switchBorder: Border.all(
              color: Color(0XFF2C2C2C),
              width: 1,
            ),
            activeColor: Color(0XFF2C2C2C),
            activeToggleColor: Color(0XFFF5F5F5),
            inactiveColor: Color(0XFFF5F5F5),
            inactiveToggleColor: Color(0XFF2C2C2C),
            onToggle: (value) {
              setState(() {
                isSelectedSwitch1 = value;
              });
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNotificationsToggleSecondary(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Notifications",
            style: TextStyle(
              color: Color(0XFF1E1E1E),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          FlutterSwitch(
            value: isSelectedSwitch2,
            height: 24,
            width: 40,
            toggleSize: 18,
            borderRadius: 12,
            switchBorder: Border.all(
              color: Color(0XFF2C2C2C),
              width: 1,
            ),
            activeColor: Color(0XFF2C2C2C),
            activeToggleColor: Color(0XFFF5F5F5),
            inactiveColor: Color(0XFFF5F5F5),
            inactiveToggleColor: Color(0XFF2C2C2C),
            onToggle: (value) {
              setState(() {
                isSelectedSwitch2 = value;
              });
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAppVersionInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2),
            child: Text(
              "App Version",
              style: TextStyle(
                color: Color(0XFFA5A5A5),
                fontSize: 16,
                fontFamily: 'Heebo',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            "1.0.0",
            style: TextStyle(
              color: Color(0XFFA5A5A5),
              fontSize: 16,
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAndroidVersionInfo(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 6, right: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Android Version",
            style: TextStyle(
              color: Color(0XFFA5A5A5),
              fontSize: 16,
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "13",
            style: TextStyle(
              color: Color(0XFFA5A5A5),
              fontSize: 16,
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHandleSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
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
    );
  }
}
