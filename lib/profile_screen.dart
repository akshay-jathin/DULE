import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController inputoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child: Stack(
          children: [
            // Background Container with gradient and rounded bottom corners
            Container(
              width: double.infinity,
              height: 150, // Adjust the height to match the design in the image
              decoration: BoxDecoration(
                color: Colors.white, // Top bar background color
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20), // Rounded bottom corners
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: [Color(0XFFA0DEFF), Color(0XFF4091C6)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context); // Go back to the previous page
                        },
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 150), // Spacing below top bar

                  // Main scrollable content inside a card
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28), // Rounded edges
                          ),
                          elevation: 4, // Add shadow for clean UI
                          color: Colors.white, // Card background color
                          child: Padding(
                            padding: const EdgeInsets.all(15), // Padding inside the card
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: 180,
                                    width: 250,
                                    child: Icon(
                                      Icons.account_circle,
                                      size: 200,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Color(0XFFE5E5EA),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 10,
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Edit photo",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 142, 142, 142),
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                _buildInputField("Name", "Enter your name", nameController),
                                SizedBox(height: 20),
                                _buildInputField("About", "Hi! I'm using DULE!", inputoneController),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hintText, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          color: Color(0XFF1E1E1E),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 8),
      Container(
        width: double.infinity,
        child: TextFormField(
          controller: controller,
          style: TextStyle(
            color: Color(0XFFB3B3B3),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0XFFB3B3B3),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color(0XFFD9D9D9),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color(0XFFD9D9D9), // Unfocused border color
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color(0XFFD9D9D9), // Focused border color
                width: 1,
              ),
            ),
            filled: true,
            fillColor: Color(0XFFFFFFFF),
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 6),
          ),
        ),
      )
    ],
  );
}
}
