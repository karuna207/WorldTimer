import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:world_timer/services/worldtime.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(url:'zone?timeZone=Asia%2FCalcutta',location: 'Calcutta',flag:'india.png'),
    WorldTime(url:'zone?timeZone=Europe%2FLondon',location: 'London',flag:'uk.png'),
    WorldTime(url:'zone?timeZone=Europe%2FAthens',location: 'Athens',flag:'greece.png'),
    WorldTime(url:'zone?timeZone=Africa%2FNairobi',location: 'Nairobi',flag:'kenya.png'),
    WorldTime(url:'zone?timeZone=America%2FChicago',location: 'Chicago',flag:'usa.png'),
    WorldTime(url:'zone?timeZone=America%2FNew_York',location: 'New York',flag:'usa.png'),
    WorldTime(url:'zone?timeZone=Asia%2FSeoul',location: 'Seoul',flag:'south_korea.png'),
    WorldTime(url:'zone?timeZone=Asia%2FJakarta',location: 'Jakarta',flag:'indonesia.png'),

  ];

  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(
      context,
      {
        'location':instance.location,
        'flag':instance.flag,
        'time':instance.time,
        'isDay':instance.isDay,
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    // print("build ran");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title:Text("Choose a Location"),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
            child: Card(
              child: ListTile(
                title:Text(locations[index].location!),
                onTap: (){
                  if (kDebugMode) {
                    print(locations[index].location);
                    updateTime(index);
                  }
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${locations[index].flag}'),
                ),
              ),
            ),
          );
      })

    );
  }
}
