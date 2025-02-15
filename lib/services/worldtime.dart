import "package:flutter/foundation.dart";
import "package:http/http.dart" as http;
import "package:intl/intl.dart";
import "dart:convert";

class WorldTime{
  String? location;
  String? time;
  String? flag;
  String? url;
  bool? isDay;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    try {
      http.Response response = await http.get(
          Uri.parse("https://timeapi.io/api/time/current/$url"));
      Map data = jsonDecode(response.body);
      if (kDebugMode) {
        print(data);
        print(data['time']);

        DateTime timeObj = DateTime.parse("2025-02-15 ${data['time']}"); // Dummy date added
        int hourValue = timeObj.hour;
        print(hourValue);

        isDay=(hourValue>=6 && hourValue<18) ? true:false;


      }


      time = data['time'];
    }
    catch (e) {
      if (kDebugMode) {
        print('Some error occured :$e');
        time="Cant fetch time currently";
      }
    }
  }

}


