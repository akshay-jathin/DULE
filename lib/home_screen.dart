import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_routes.dart';
import 'settings_screen.dart';

// ignore_for_file: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Container(
              padding: EdgeInsets.only(top: 0, bottom: 16),
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
                  _buildTopAppBar(context),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [_buildHomeList(context)],
                    ),
                  ),
                  _buildHandleSection(context),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: _buildFloatingActionButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildTopAppBar(BuildContext context) {
  return Container(
    width: double.maxFinite,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment(0.5, 0),
        end: Alignment(0.5, 1),
        colors: [Color(0XFFA0DEFF), Color(0XFF2A7FB9)],
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10),
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: IconButton(
                  onPressed: () {
                    // Implement the navigation to SettingsScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
                    );
                  },
                  constraints: BoxConstraints(
                    minHeight: 32,
                    minWidth: 32,
                  ),
                  padding: EdgeInsets.all(0),
                  icon: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.all(2),
                    child: SvgPicture.asset(
                      "assets/images/img_generic_avatar.svg",
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Image.asset(
                    "assets/images/Dule_Logo-removebg-preview 2.png",
                    height: 72,
                    width: 90,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      // Navigate to the settings page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsScreen()),
                      );
                    },
                    icon: SvgPicture.asset(
                      "assets/images/img_settings.svg",
                      height: 32,
                      width: 32,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: TextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: searchController,
                  style: TextStyle(
                    color: Color(0XFF79747E),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Color(0XFF79747E),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        Icons.search,
                        color: Color(0xff757575),
                      ),
                    ),
                    suffixIcon: Container(
                      margin: EdgeInsets.all(16),
                      child: SvgPicture.asset(
                        "assets/images/img_icon.svg",
                        height: 24,
                        width: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                    filled: true,
                    fillColor: Color(0XFFE5E5EA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24), // Increase curvature here
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

  /// Section Widget
  Widget _buildHomeList(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (context, index) {
        return HomelistItemWidget();
      },
    );
  }

  /// Section Widget
  Widget _buildHandleSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        children: [
          SizedBox(
            width: 108,
            child: Divider(
              height: 4,
              thickness: 4,
              color: Color(0XFF1D1B20),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0XFFE5E5EA),
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        height: 56,
        width: 56,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0XFFA0DEFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          height: 28.0,
          width: 28.0,
          child: SvgPicture.asset(
            "assets/images/img_fab.svg",
            height: 28.0,
            width: 28.0,
          ),
        ),
      ),
    );
  }
}

class HomelistItemWidget extends StatelessWidget {
  const HomelistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                "assets/images/img_person.svg",
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                    color: Color(0XFFC4C4C4),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 154,
                  child: Text(
                    "Hi there, I'm using DULE",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0XFFC4C4C4),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 16),
          Text(
            "10 min",
            style: TextStyle(
              color: Color(0XFFC4C4C4),
              fontSize: 11,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
