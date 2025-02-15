import 'package:flutter/material.dart'; 


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {



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

    );
  }
}
