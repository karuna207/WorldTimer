import 'package:flutter/material.dart';
import 'package:world_timer/pages/Choose_location.dart';
import 'package:world_timer/pages/Home.dart';
import 'package:world_timer/pages/Loading_screen.dart';


void main() {
  runApp(MaterialApp(
    initialRoute:'/',
    routes: {
      '/':(context){
        return LoadingScreen();
      },
      '/home':(context){
        return Home();
      },
      '/location':(context){
        return ChooseLocation();
      }
    },
  ));
}




