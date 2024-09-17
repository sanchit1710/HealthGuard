import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_tracker/user_page.dart';
import 'package:health_tracker/doctor_page.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "img/loginimg.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sanchit",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        width: w * 0.7,
                        height: h * 0.25,
                        child: Image.asset(
                          'img/gify4.gif', // Replace 'img/medical_records.gif' with your actual image file path
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButtonWithPhoto(
                        text: "User",
                        imagePath: "img/person_icon.png",
                        onPressed: () {
                          // Navigate to UserPage
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage()));
                        },
                      ),
                      ElevatedButtonWithPhoto(
                        text: "Doctor",
                        imagePath: "img/doctor_icon.jpeg",
                        onPressed: () {
                          // Navigate to DoctorPage
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Doctor()));
                        },
                      ),
                      ElevatedButtonWithPhoto(
                        text: "Prediction",
                        imagePath: "img/hemo.jpg",
                        onPressed: () {
                          // Navigate to Prediction page
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => PredictionPage()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
