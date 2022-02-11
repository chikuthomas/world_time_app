
import 'package:flutter/material.dart';
import 'package:word_time_app/pages/choose_location.dart';
import 'package:word_time_app/pages/home.dart';
import 'package:word_time_app/pages/loading.dart';



  void main() => runApp( MaterialApp(

    debugShowCheckedModeBanner: false,

  initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation(),
    },


  ));




