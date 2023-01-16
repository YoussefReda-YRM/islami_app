// import 'dart:math';
//
// import 'package:adhan_dart/adhan_dart.dart';
// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:provider/provider.dart';
// import '../../Providers/settings_provider.dart';
// import 'package:flutter_compass/flutter_compass.dart';
//
// class QiblaCompass extends StatefulWidget {
//
//   @override
//   State<QiblaCompass> createState() => _QiblaCompassState();
// }
//
// class _QiblaCompassState extends State<QiblaCompass> {
//   Location location = Location();
//   late Stream<LocationData> locationData ;
//
//   @override
//   void initState() {
//     locationData = location.onLocationChanged;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var settingsProvider = Provider.of<SettingsProvider>(context);
//     return StreamBuilder<LocationData>(
//       stream: locationData,
//       builder: (context, snapshot) {
//         if(snapshot.hasData)
//         {
//           snapshot.data;
//            Coordinates coordinates = Coordinates(snapshot.data!.latitude, snapshot.data!.longitude);
//            double degree = Qibla.qibla(coordinates);
//           double qibla = degree * (pi/180);
//           return Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(settingsProvider.getMainBackGround()),
//                   fit: BoxFit.fill),
//             ),
//             child: LayoutBuilder(
//               builder: (context, constraints)
//               {
//                 final height = constraints.maxHeight;
//                 final width = constraints.maxWidth;
//                 return Scaffold(
//                   appBar: AppBar(
//                     title: Text(
//                         'قبلة الصلاة'
//                     ),
//                   ),
//                   body: Column(
//                     children: [
//                       SizedBox(height: 40.0,),
//                       Transform.rotate(
//                         angle: qibla,
//                         child: StreamBuilder<CompassEvent>(
//                           stream: FlutterCompass.events,
//                           builder: (context, snapshot2) {
//                             if(snapshot2.hasData)
//                             {
//                               return SizedBox(
//                                 height: width,
//                                 width: width,
//                                 child: Center(
//                                   child: Transform.rotate(
//                                       angle: qibla,
//                                       child: Image.asset('assets/images/qibla.png',width: width,height: width,)),
//                                 ),
//                               );
//                             }else
//                             {
//                               return Center(
//                                 child: CircularProgressIndicator(),
//                               );
//                             }
//                           }
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         }else
//         {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       }
//     );
//   }
// }
