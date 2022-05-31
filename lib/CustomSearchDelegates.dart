// import 'package:flutter/material.dart';
// import 'package:ritu/WeatherData.dart';
//
// class CustomSearchDelegates extends SearchDelegate {
//   List<String> suggestions = ["inda", "america", "Canada", "Japan"];
//
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     IconButton(
//       icon: Icon(Icons.arrow_back_ios),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           if (query.isEmpty) {
//             close(context, null);
//           } else {
//             query = "";
//           }
//         },
//       )
//     ];
//   }
//
//   @override
//   Widget buildResults(BuildContext context)  {
//
//     if (query != null) {
//
//       return getCityReport(query);
//
//
//     } else if (query == "") {
//       return Text("");
//     } else {
//       return ListTile(
//         title: Text("No result found"),
//         onTap: () {},
//       );
//     }
//
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return ListView.builder(
//         itemCount: suggestions.length,
//         itemBuilder: (context, index) {
//           final suggestion = suggestions[index];
//           return ListTile(
//             title: Text(suggestion),
//             onTap: () {
//               query = suggestion;
//               print("tapped");
//             },
//           );
//         });
//   }
//   dynamic getCityReport(String data)async {
//
//     WeatherData weatherData = WeatherData(data);
//     dynamic mausem = await weatherData.getCitydata(data);
//
//     return mausem;
//   }
//
// }