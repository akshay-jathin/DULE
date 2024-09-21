import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore_for_file: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHorizontalScrollSection(context),
                SizedBox(height: 32),
                _buildLineSection(context),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalScrollSection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: SizedBox(
          height: 722,
          width: 422,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment(0.5, 0),
                      end: Alignment(0.5, 1),
                      colors: [Color(0XDDA0DEFF), Color(0XDD2A7FB9)],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppBar(
                        elevation: 0,
                        toolbarHeight: 36,
                        backgroundColor: Colors.transparent,
                        automaticallyImplyLeading: false,
                        leadingWidth: 82,
                        leading: Padding(
                          padding: EdgeInsets.only(
                            left: 44,
                            bottom: 2,
                          ),
                          child: SizedBox(
                            height: 34,
                            width: 38,
                            child: SvgPicture.asset(
                              "assets/images/img_play_arrow.svg",
                            ),
                          ),
                        ),
                        title: Padding(
                          padding: EdgeInsets.only(left: 1),
                          child: Text(
                            "Settings",
                            style: TextStyle(
                              color: Color(0XFFF2F2F7),
                              fontSize: 20,
                              fontFamily: 'Heebo',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        actions: [
                          Padding(
                            padding: EdgeInsets.only(right: 50),
                            child: SizedBox(
                              height: 36,
                              width: 34,
                              child: SvgPicture.asset(
                                "assets/images/img_menu.svg",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(
                          left: 50,
                          right: 54,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 318,
                              child: TextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: searchController,
                                style: TextStyle(
                                  color: Color(0XFFAEAEB2),
                                  fontSize: 13,
                                  fontFamily: 'Heebo',
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                    color: Color(0XFFAEAEB2),
                                    fontSize: 13,
                                    fontFamily: 'Heebo',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  prefixIcon: Container(
                                    margin: EdgeInsets.fromLTRB(10, 8, 16, 8),
                                    child: SvgPicture.asset(
                                      "assets/images/img_search.svg",
                                      height: 24,
                                      width: 22,
                                    ),
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(
                                      right: 15,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        searchController.clear();
                                      },
                                      icon: Icon(
                                        Icons.clear,
                                        color: Color(0xff757575),
                                      ),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Color(0XFFF2F2F7),
                                ),
                                onChanged: (value) {},
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 102)
                    ],
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 130,
                ),
                decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(
                    32,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Notification sound",
                            style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0), // You can adjust the padding as needed
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset(
                                "assets/images/img_attach_file.svg",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.maxFinite,
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0XFFE5E5EA),
                        indent: 6,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(right: 6),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "App Version",
                            style: TextStyle(
                              color: Color(0XFFA5A5A5),
                              fontSize: 16,
                              fontFamily: 'Heebo',
                              fontWeight: FontWeight.w400,
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
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 6),
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
                          Padding(
                            padding: EdgeInsets.only(right: 22),
                            child: Text(
                              "13",
                              style: TextStyle(
                                color: Color(0XFFA5A5A5),
                                fontSize: 16,
                                fontFamily: 'Heebo',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 186)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLineSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(
            left: 18,
            right: 22,
          ),
          padding: EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Divider(
                  height: 5,
                  thickness: 5,
                  color: Color(0XFFE5E5EA),
                  indent: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
