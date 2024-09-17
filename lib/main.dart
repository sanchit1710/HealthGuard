import 'package:flutter/material.dart';
import 'package:health_tracker/doctor_page.dart';
import 'package:health_tracker/login_page.dart';
import 'package:health_tracker/signup_page.dart';
import 'package:health_tracker/user_page.dart';
import 'package:health_tracker/welcome_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: LoginPage(),
  ));
}

