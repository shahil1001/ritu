import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ritu/CityScreen.dart';
import 'package:ritu/Ritu.dart';
import 'package:ritu/WeatherData.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WelComeScreen(),
  ));
}
class WelComeScreen extends StatefulWidget {
  const WelComeScreen({Key? key}) : super(key: key);

  @override
  State<WelComeScreen> createState() => _WelComeScreenState();
}

class _WelComeScreenState extends State<WelComeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SendToRituPage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: SpinKitFadingFour(
        size: 50,
        color: Colors.white,

      ),
    );
  }

  void SendToRituPage()async {
    WeatherData weatherData=WeatherData();
    dynamic data=await weatherData.locationData();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Ritu(data)));
  }
}
