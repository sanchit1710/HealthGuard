import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:health_tracker/bp_page.dart';
import 'package:health_tracker/signup_page.dart';
import 'package:get/get.dart';
import 'package:health_tracker/welcome_page.dart'; // Import the respective screens for navigation


class UserPage extends StatefulWidget {
  const UserPage({Key? key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // Method to handle the upload button
  void _handleUploadPDF() {
    // Implement the logic to handle uploading PDF document
    // This could involve using plugins like file_picker to select the PDF file
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/loginimg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          // Navigate back
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "Lab Report",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButtonWithPhoto(
                    text: "Blood Pressure",
                    imagePath: "img/bp.jpg",
                    onPressed: () {
                      // Navigate to Blood Pressure screen
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BloodPressurePage()));
                    },
                  ),
                  ElevatedButtonWithPhoto(
                    text: "Complete Hemogram",
                    imagePath: "img/hemo.jpg",
                    onPressed: () {
                      // Navigate to Blood Glucose screen
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => BloodGlucoseScreen()));
                    },
                  ),
                  ElevatedButtonWithPhoto(
                    text: "Lipid Profile Test",
                    imagePath: "img/lipid.jpg",
                    onPressed: () {
                      // Navigate to Blood Glucose screen
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => BloodGlucoseScreen()));
                    },
                  ),
                  ElevatedButtonWithPhoto(
                    text: "Liver Function Test",
                    imagePath: "img/liver.jpg",
                    onPressed: () {
                      // Navigate to Blood Glucose screen
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => BloodGlucoseScreen()));
                    },
                  ),
                  ElevatedButtonWithPhoto(
                    text: "Vitamins",
                    imagePath: "img/vitamins.jpg",
                    onPressed: () {
                      // Navigate to Blood Glucose screen
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => BloodGlucoseScreen()));
                    },
                  ),
                  ElevatedButtonWithPhoto(
                    text: "Thyroid Profile",
                    imagePath: "img/thyroid.jpg",
                    onPressed: () {
                      // Navigate to Blood Glucose screen
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => BloodGlucoseScreen()));
                    },
                  ),
                  ElevatedButtonWithPhoto(
                    text: "Kidney Function Test",
                    imagePath: "img/kidney.jpg",
                    onPressed: () {
                      // Navigate to Blood Glucose screen
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => BloodGlucoseScreen()));
                    },
                  ),
                  ElevatedButtonWithPhoto(
                    text: "Iron Profile",
                    imagePath: "img/iron.jpg",
                    onPressed: () {
                      // Navigate to Blood Glucose screen
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => BloodGlucoseScreen()));
                    },
                  ),
                  ElevatedButtonWithPhoto(
                    text: "Urine Routine Test",
                    imagePath: "img/urine.jpg",
                    onPressed: () {
                      // Navigate to Blood Glucose screen
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => BloodGlucoseScreen()));
                    },
                  ),
                  // Add more buttons for other parameters with respective navigation
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleUploadPDF,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue, // Change color as needed
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class ElevatedButtonWithPhoto extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onPressed;

  const ElevatedButtonWithPhoto({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(1, 1),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 24,
          ),
          title: Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}

