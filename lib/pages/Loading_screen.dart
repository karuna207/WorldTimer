import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getData() async{
        Response response=await get('https://jsonplaceholder.typicode.com/todos/1' as Uri);
        Map data=jsonDecode(response.body);
        if (kDebugMode) {
          print(data);
        }

  }


  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: Text("Loading Screen")),
    );
  }


}
