import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class PrayerTimings extends StatefulWidget {

  @override
  State<PrayerTimings> createState() => _PrayerTimingsState();
}

class _PrayerTimingsState extends State<PrayerTimings> {
  Location location = Location();
  late PrayerTimes prayertimes ;
  late DateTime date ;
  late Coordinates coordinates ;
  late CalculationParameters params ;
  late Stream<LocationData> locationData ;

  @override
  void initState() {
    locationData = location.onLocationChanged;
    date = DateTime.now();
    params = CalculationMethod.Egyptian();
    super.initState();
  }

  String timePresenter(DateTime dateTime)
  {
    bool isGreaterThan12 = dateTime.hour > 12 ;
    String prefix = dateTime.hour > 11 ? 'م':'ص';
    int hour = isGreaterThan12 ? dateTime.hour-12 : dateTime.hour;
    int minute = dateTime.minute ;
    String hourInString = hour.toString().length == 1 ? '0$hour' : '$hour';
    String minuteInString = minute.toString().length == 1 ? '0$minute' : '$minute';

    return '$minuteInString : $hourInString $prefix';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LocationData>(
      stream: locationData,
      builder: (context, snapshot) {
        if(snapshot.hasData)
        {
          snapshot.data;
          coordinates = Coordinates(snapshot.data!.latitude, snapshot.data!.longitude);
          prayertimes = PrayerTimes(coordinates, date, params,precision: true);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: ()
                        {
                          date=date.add(Duration(days: 1));
                          setState(() {});
                        },
                        child: Icon(
                          Icons.arrow_left,
                          size: 60.0,
                          color: Color(0xFFFACC1D),
                        ),
                      ),
                      Text(
                        '${date.day}-${date.month}-${date.year}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: ()
                        {
                          date=date.add(Duration(days: -1));
                          setState(() {});
                        },
                        child: Icon(
                          Icons.arrow_right,
                          size: 60.0,
                          color: Color(0xFFFACC1D),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  prayerTiming(
                    prayerName: 'الفجر',
                    prayerTiming: timePresenter(prayertimes.fajr!.toLocal()),
                  ),
                  SizedBox(height: 10.0,),
                  prayerTiming(
                    prayerName: 'الشروق',
                    prayerTiming: timePresenter(prayertimes.sunrise!.toLocal()),
                  ),
                  SizedBox(height: 10.0,),
                  prayerTiming(
                    prayerName: 'الظهر',
                    prayerTiming: timePresenter(prayertimes.dhuhr!.toLocal()),
                  ),
                  SizedBox(height: 10.0,),
                  prayerTiming(
                    prayerName: 'العصر',
                    prayerTiming: timePresenter(prayertimes.asr!.toLocal()),
                  ),
                  SizedBox(height: 10.0,),
                  prayerTiming(
                    prayerName: 'المغرب',
                    prayerTiming: timePresenter(prayertimes.maghrib!.toLocal()),
                  ),
                  SizedBox(height: 10.0,),
                  prayerTiming(
                    prayerName: 'العشاء',
                    prayerTiming: timePresenter(prayertimes.isha!.toLocal()),
                  ),
                  SizedBox(height: 20.0,),
                  // InkWell(
                  //   onTap: ()
                  //   {
                  //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => QiblaCompass()));
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  //     child: Container(
                  //       width: double.infinity,
                  //       height: 50.0,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(15),
                  //         color: Theme.of(context).primaryColorLight,
                  //         border: Border.all(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(
                  //           left: 30.0,
                  //           right: 30.0,
                  //         ),
                  //         child: Center(
                  //           child: Text(
                  //             'اتجاة القبلة',
                  //             style: TextStyle(
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.w500,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 10.0,),
                ],
              ),
            ),
          );
        }else
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }

  Widget prayerTiming({
    required prayerName,
    required prayerTiming,
}) => Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
    child: Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).primaryColorLight,
        border: Border.all(
          color: Color(0xFFFACC1D),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
        ),
        child: Row(
          children: [
            Text(
              prayerName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Text(
              prayerTiming,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
