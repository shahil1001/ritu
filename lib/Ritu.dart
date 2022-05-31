import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ritu/CityScreen.dart';
import 'package:ritu/Condition.dart';

import 'WeatherData.dart';

class Ritu extends StatefulWidget {
  dynamic mausem;

  Ritu(this.mausem);

  @override
  State<Ritu> createState() => _RituState();
}

class _RituState extends State<Ritu> {
  Conditions conditions=Conditions();
  late String nameOfPlace;
  late int temp, humidity, visibility,condition;
  late String description, discription;
  WeatherData weatherData = WeatherData();

  @override
  void initState() {
    super.initState();
    UpdateUi(widget.mausem);
    print(conditions.image[0]);
  }

  void UpdateUi(dynamic data) async {
    nameOfPlace = data["name"];
    double mtemp = data["main"]["temp"];
    temp = mtemp.toInt();
    humidity = data["main"]["humidity"];
    visibility = data["visibility"];
    description = data["weather"][0]["description"];

    condition=data["weather"][0]["id"];
    print(condition);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Container(
      decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(conditions.getImage(condition)),
        fit: BoxFit.cover
      )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            // title: Text("Ritu",style: GoogleFonts.acme(fontSize: 30),),
            leading: IconButton(
              icon: Icon(
                Icons.refresh,
                size: 30,
                color: Colors.white.withOpacity(0.8),
              ),
              onPressed: () async {
                // TODO: put RefersScreenhere
                dynamic weatherdata = await weatherData.locationData();

                setState(() {
                  UpdateUi(weatherdata);
                });
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  //TODO: open city screen.. . ..
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CityScreen()));
                },
                icon: Icon(
                  Icons.location_city,
                  size: 30,
                  color: Colors.white.withOpacity(0.8),
                ),
                color: Colors.white.withOpacity(0.8),
              )
            ],
          ),
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "  $nameOfPlace".toUpperCase(),
                      style: GoogleFonts.abel(
                          fontSize: 40, color: Colors.white.withOpacity(0.9)),
                    ),
                    Text(
                      "$temp\u00B0".toUpperCase(),
                      style: GoogleFonts.lato(
                        fontSize: 150,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${conditions.getMessage(temp)} In ${nameOfPlace.toUpperCase()}" ,style: GoogleFonts.lato(fontSize: 50,color: Colors.white.withOpacity(0.9)),),
                    ),
                    //Image.network('http://openweathermap.org/img/w/${img}.png',width: 50,height: 50,),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$humidity\u00B0",
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),

                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Humidity",
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.white.withOpacity(0.8)),
                              ),

                              // Text("11km"),
                              // Text("Visibility"),
                              //
                              // Text("Condition"),
                              // Text("Cleary Sky"),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${visibility / 1000}\ km",
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Visibility",
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.white.withOpacity(0.8)),
                              ),

                              // Text("11km"),
                              // Text("Visibility"),
                              //
                              // Text("Condition"),
                              // Text("Cleary Sky"),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Condition",
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$description",
                                style: GoogleFonts.lato(
                                    fontSize: 18,
                                    color: Colors.white.withOpacity(0.8)),
                              ),

                              // Text("11km"),
                              // Text("Visibility"),
                              //
                              // Text("Condition"),
                              // Text("Clear Sky"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 15,
                right: 10,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Column(
                    children: [
                      Text(
                        "It's $description",
                        style:
                            GoogleFonts.lato(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
