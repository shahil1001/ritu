

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:ritu/Ritu.dart';
import 'package:ritu/WeatherData.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  // Conditions conditions=Conditions();
   String  city="";
bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/myui.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
            ),
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [

                Container(
                  margin: EdgeInsets.only(top: 30),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                      ),
                      onChanged: (value) {
                       setState(() {
                         city = value;
                       });
                      },
                    ),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
                ElevatedButton(

                    onPressed: () async {
                      setState(() {
                        isLoading=true;
                      });
                      WeatherData weatherdata=WeatherData();

                   if(city!=""){
                     dynamic data=await weatherdata.getCitydata(city.trim());

                   if(data!=null){
                     setState(() {
                       isLoading=false;
                     });
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Ritu(data)));
                   }else{
                    setState(() {
                      isLoading=false;
                    });
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter A Valid Place Name")));
                   }
                   }else{
                 setState(() {
                   isLoading=false;
                 });

                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                   content: Text("Please Enter The Place's Name"),
                 ));
                   }
                    },
                    child: Text(
                      "GetWeather",
                      style: GoogleFonts.lato(),
                    )),
                SizedBox(height: 100,),
                isLoading? SpinKitCircle(
                  size: 100,
                  color: Colors.white,
                ):Container()
              ],
            ),
          )),
    );
  }
}
