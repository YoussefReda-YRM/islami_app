// import 'package:flutter/material.dart';
// import 'package:islami/home/prayerTimings/qibla_compass.dart';
// import 'package:location/location.dart';
//
// class PermissionPage extends StatefulWidget {
//
//   @override
//   State<PermissionPage> createState() => _PermissionPageState();
// }
//
// class _PermissionPageState extends State<PermissionPage> {
//   Location location = Location();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Future<PermissionStatus>checkPermission()async
//   {
//     return await location.hasPermission();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<PermissionStatus>(
//         future: checkPermission(),
//         builder: (context,snapshot)
//         {
//           if(snapshot.hasData)
//           {
//             if(snapshot.data == PermissionStatus.granted)
//             {
//               return QiblaCompass();
//             }else
//             {
//               return Center(
//                 child: ElevatedButton(
//                   onPressed: ()async
//                   {
//                     await location.requestPermission();
//                   },
//                   child: Text(
//                     'السماح بالوصول الى الموقع',
//                   ),
//                 ),
//               );
//             }
//           }
//           else
//           {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
