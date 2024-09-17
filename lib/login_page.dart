import 'package:health_tracker/welcome_page.dart';// Adjust the path accordingly
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:health_tracker/signup_page.dart';
import 'package:get/get.dart';// Import the DashboardScreen

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                Center(child: Text("Health Tracker", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.orangeAccent))),
                Center(
                  child: Text(
                    "Sign into your Account",
                    style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email, color: Colors.deepOrangeAccent),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password_outlined, color: Colors.deepOrangeAccent),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Text(
                      "Forgot Password",
                      style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              // Navigate to DashboardScreen on sign in
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
            },
            child: Container(
              width: w * 0.4,
              height: h * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage("img/loginbtn.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: "Don\'t have an account?",
              style: TextStyle(color: Colors.grey[500], fontSize: 20),
              children: [
                TextSpan(
                  text: " Create",
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(() => SignUpPage());
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
