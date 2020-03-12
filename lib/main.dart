import 'package:doctors_of_salahaldin/Model/Doctors.dart';
import 'package:doctors_of_salahaldin/UI_Pages/RegesterPage.dart';
import 'package:doctors_of_salahaldin/UI_Pages/Search.dart';
import 'package:doctors_of_salahaldin/SeplashScreenPages/SeplashScreen.dart';
import 'package:doctors_of_salahaldin/UI_Pages/homePagewWithoutlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doctors_of_salahaldin/UI_Pages/InfoDoctorPage.dart';
import 'package:doctors_of_salahaldin/UI_Pages/LoginPage.dart';
import 'package:doctors_of_salahaldin/UI_Pages/AddDoctorpage.dart';
import 'package:doctors_of_salahaldin/UI_Pages/homePage.dart';

import 'About/AboutApp.dart';
import 'About/AboutCodeForIraq.dart';
import 'About/AboutTeam.dart';

final myAuth = FirebaseAuth.instance;

void main() {
  runApp(MaterialApp(
    theme: new ThemeData(fontFamily: 'Raleway'),
      home: new SeplashScreen(),
      debugShowCheckedModeBanner: false,
      title: 'دليل اطباء صلاح الدين',
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => new LoginPage(),
        '/Regester': (BuildContext context) => new RegesterPage(),
        '/HomepageWithoutLogin': (BuildContext context) => new HomepageWithoutLogin(),
        '/Homepage': (BuildContext context) => new HomePage(),
        '/CodeForIraq': (BuildContext context) => new AboutCodeForIraq(),
        '/AboutTeam': (BuildContext context) => new AboutTeam(),
        '/AboutApp': (BuildContext context) => new AboutApp(),
        '/Search': (BuildContext context) => new Search(),
      }));
}
