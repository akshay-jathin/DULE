import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  late TabController tabviewController;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeaderSection(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      _buildLoginFormSection(context), // Pass context for navigation
                      _buildRegisterFormSection(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/Dule_Logo-removebg-preview 2.png",
              height: 124,
              width: 118,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Login",
            style: TextStyle(
              color: Color(0XFF000000),
              fontSize: 40,
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 2),
          Container(
            width: 198,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0XFFB1B1B1),
                  width: 1,
                ),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
              child: TabBar(
                controller: tabviewController,
                labelPadding: EdgeInsets.zero,
                labelColor: Color(0XFF0386D0),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                unselectedLabelColor: Color(0XFF767676),
                unselectedLabelStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0XFF0386D0),
                      width: 1,
                    ),
                  ),
                ),
                dividerHeight: 0.0,
                tabs: [
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Text("Login"),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Text("Register"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginFormSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 28),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildFormFieldsSection(context),
            SizedBox(height: 30),
            //_buildImageSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterFormSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 28),
      child: SingleChildScrollView( // Allows scrolling if the keyboard is open
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  // Name TextFormField
                  SizedBox(
                    width: 360,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(
                          color: Color(0XFFB3B3B3),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(0XFFD9D9D9), width: 1),
                        ),
                        filled: true,
                        fillColor: Color(0XFFFFFFFF),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),
                  SizedBox(height: 24), // Space between fields

                  // Email TextFormField
                  SizedBox(
                    width: 360,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email address",
                        hintStyle: TextStyle(
                          color: Color(0XFFB3B3B3),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(0XFFD9D9D9), width: 1),
                        ),
                        filled: true,
                        fillColor: Color(0XFFFFFFFF),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),
                  SizedBox(height: 24), // Space between fields

                  // Password TextFormField
                  SizedBox(
                    width: 360,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Color(0XFFB3B3B3),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(0XFFD9D9D9), width: 1),
                        ),
                        filled: true,
                        fillColor: Color(0XFFFFFFFF),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      obscureText: true, // Hides password input
                    ),
                  ),
                  SizedBox(height: 24), // Space between fields

                  // Re-enter Password TextFormField
                  SizedBox(
                    width: 360,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Re-enter Password",
                        hintStyle: TextStyle(
                          color: Color(0XFFB3B3B3),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(0XFFD9D9D9), width: 1),
                        ),
                        filled: true,
                        fillColor: Color(0XFFFFFFFF),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      obscureText: true, // Hides password input
                    ),
                  ),
                  SizedBox(height: 24), // Space before button

                  // Register Button
                  Container(
                    width: double.maxFinite,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 80),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0XFF0386D0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      ),
                      onPressed: () {
                        // Handle registration logic
                        Navigator.pushNamed(context, '/home'); // Navigate to home screen
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Color(0XFFF5F5F5),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Space before any other widgets
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormFieldsSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        children: [
          SizedBox(
            width: 360,
            child: TextFormField(
              controller: phoneController,
              style: TextStyle(
                color: Color(0XFFB3B3B3),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: "Email address / Phone no.",
                hintStyle: TextStyle(
                  color: Color(0XFFB3B3B3),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0XFFD9D9D9), width: 1),
                ),
                filled: true,
                fillColor: Color(0XFFFFFFFF),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: 360,
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(
                color: Color(0XFFB3B3B3),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Color(0XFFB3B3B3),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0XFFD9D9D9), width: 1),
                ),
                filled: true,
                fillColor: Color(0XFFFFFFFF),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      Expanded( // Use Expanded to prevent overflow
                        child: Text(
                          "Remember me",
                          style: TextStyle(
                            color: Color(0XFF1E1E1E),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis, // This will handle overflow with ellipsis
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/forgot-password'); // Navigate to forgot password
                  },
                  child: Text(
                    "Forgot password",
                    style: TextStyle(
                      color: Color(0XFF0386D0),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis, // Handle text overflow here as well
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: double.maxFinite,
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 80),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Color(0XFF0386D0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home'); // Navigate to home screen
              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: Color(0XFFF5F5F5),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

/*
  Widget _buildImageSection() {
    return SizedBox(
      height: 244,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(122),
            child: Image.asset(
              "assets/images/img_image_12.png",
              height: 244,
              width: double.maxFinite,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Image.asset(
                "assets/images/img_subtract.png",
                height: 184,
                width: double.maxFinite,
              ),
            ),
          ),
        ],
      ),
    );
  } */
}
