import 'dart:convert';

import 'package:http/http.dart' as http;

class NetWorking {
  String url;

  NetWorking(this.url); //final String url="https://api.openweathermap.org/data/2.5/weather?lat=-5.025283&lon=23.459931&appid=cd8a47326a9267e8191134b6727a0de8&units=metric";
  Future<dynamic>GetWeatherData() async {
     var formateddata;
    var response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
       formateddata=jsonDecode(response.body);
    }
    print(formateddata);
    return formateddata;
    //return response;
  }
}
