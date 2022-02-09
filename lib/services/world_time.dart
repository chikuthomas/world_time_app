import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location; //location name for user interface
  String? time; // the time in that location
  String? flag; //url to an asset flag icon
  String? url; // location url for api endpoint
  bool? isDaytime; // for changing the background image

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties from data

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create DateTime Object
      DateTime now = DateTime.parse(datetime);
      //adding the offset to the current time
      now = now.add(Duration(hours: int.parse(offset)));

      //Getting the background image using the ternary operator
      isDaytime = now.hour >= 6 && now.hour < 18 ? true : false;
      //we have formatted the date and time according to the package we have installed called intl
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
