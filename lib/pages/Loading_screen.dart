import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:world_timer/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});


  @override
  State<LoadingScreen> createState() => _TimeZoneAppState();


}

class _TimeZoneAppState extends State<LoadingScreen> {



  void setupTime() async{
    WorldTime instance= WorldTime(location: 'Calcutta',flag:'india.png',url:'zone?timeZone=Asia%2FCalcutta');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDay':instance.isDay,
    });
  }

  @override
  void initState(){
    super.initState();
    setupTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title:Text("WorldClock"),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: Center(
            child: SpinKitPouringHourGlassRefined(
              color: Colors.white,
              size: 50.0,
            ),
            ),
    );
  }
}
