import 'package:geolocator/geolocator.dart';
import 'package:ritu/NetWorking.dart';

final String apiKey = "cd8a47326a9267e8191134b6727a0de8";

class WeatherData {
  late Position position;

  Future<dynamic> locationData() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    NetWorking netWorking = NetWorking(
        "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric");
    dynamic data = await netWorking.GetWeatherData();
    getCitydata("");
    return data;
  }

  Future<dynamic> getCitydata(String city) async {
    NetWorking netWorking = NetWorking(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric");
    dynamic citydata = await netWorking.GetWeatherData();
    return citydata;
    // https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
  }
}
