import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings/profile_screen.dart';
import 'app_routes.dart';
import 'settings_screen.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();
  TextEditingController emailPhoneController = TextEditingController(); // Controller for input in the overlay

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the app bar
      backgroundColor: Colors.white, // Set background color to white
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent, // Make the status bar transparent
          statusBarIconBrightness: Brightness.dark, // Set the status bar icons to dark
          statusBarBrightness: Brightness.light, // Use light background
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopAppBar(context), // context is available here
              _buildHomeList(context),  // pass context to the methods
            ],
          ),
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  /// Top AppBar
  Widget _buildTopAppBar(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFA0DEFF), Color(0xFF2A7FB9)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFF2A7FB9),
                radius: 24,
                child: IconButton(
                  icon: Icon(Icons.person, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen()),
                    );
                  },
                ),
              ),
              Image.asset(
                "assets/images/Dule_Logo-removebg-preview 2.png",
                height: 100,
                width: 100,
              ),
              CircleAvatar(
                backgroundColor: Color.fromARGB(0, 42, 128, 185),
                radius: 24,
                child: IconButton(
                  icon: Icon(Icons.settings, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Home List (Chat List)
  Widget _buildHomeList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Add padding around the list
      child: Card(  // Wrap the ListView.builder in a Card
        elevation: 4, // Optional: Add some elevation for a shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Rounded corners
        ),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: 7,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _buildChatItem(context); // Pass context here
          },
        ),
      ),
    );
  }

  /// Chat Item (Individual chat item layout)
  Widget _buildChatItem(BuildContext context) { // Accept context here
    return Container(
      width: MediaQuery.of(context).size.width, // Ensure full width
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border(bottom: BorderSide(color: Color(0XFFCAC4D0), width: 0.5)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xFF2A7FB9),
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Hi there, I'm using DULE",
                  style: TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Text(
            "10 min",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// Floating Action Button (Interactivity)
  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showBluetoothScanningOverlay(context);  // Show the overlay when button is pressed
      },
      backgroundColor: Color(0xFF2A7FB9),
      child: Icon(Icons.add, color: Colors.white),
    );
  }

  void _showBluetoothScanningOverlay(BuildContext context) {
  List<String> dummyDevices = ["Device 1", "Device 2", "Device 3", "Device 4"];
  String? selectedDevice;

  showDialog(
    context: context,
    barrierDismissible: true, // Allows closing the dialog by tapping outside
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Makes the dialog fit content
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scanning for Bluetooth devices...',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Changed to black for visibility
                    ),
                  ),
                  SizedBox(height: 16),

                  // Lottie Animation
                  Center(
                    child: Lottie.asset(
                      'assets/animations/bluetooth.json', // Replace with your animation file
                      width: 240, // Adjust width as needed
                      height: 240, // Adjust height as needed
                      fit: BoxFit.fill,
                    ),
                  ),








































































                  

                  SizedBox(height: 24),

                  // Available devices list
                  Text(
                    'Available Devices',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),

                  // List of dummy Bluetooth devices
                  Container(
                    height: 150, // Set height for the list
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: dummyDevices.length,
                      itemBuilder: (context, index) {
                        String device = dummyDevices[index];
                        bool isSelected = device == selectedDevice;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDevice = device;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                            margin: EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Color(0xFF2A7FB9).withOpacity(0.2) // Highlight selected device
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected ? Color(0xFF2A7FB9) : Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.bluetooth, color: Colors.grey),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    device,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: isSelected ? Color(0xFF2A7FB9) : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 16),

                  // "Add Device" button
                  Center(
                    child: ElevatedButton(
                      onPressed: selectedDevice != null
                          ? () {
                              // Handle adding the selected device
                              Navigator.pop(context); // Close the dialog after submission
                              print('Device added: $selectedDevice'); // For testing
                            }
                          : null, // Disable button if no device selected
                      child: Text('Add Device'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        foregroundColor: Colors.white, // Text color
                        backgroundColor: selectedDevice != null
                            ? Color(0xFF2A7FB9) // Button enabled color
                            : Colors.grey, // Disabled button color
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white, // Card background color
          );
        },
      );
    },
  );
}
}
