import 'package:flutter/material.dart';
import 'package:flutter_application_login_test/main.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<MyApp> createState()=> _MyAppState(); 
  }

  class _MyAppState extends State<MyApp> {
  DateTime today =DateTime.now();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text( "Upcoming: ")),
        body: content(),
      )
      }

    Widget content() {
      return Column(
        children: [
          const Text("123"),
          Container(
            child: TableCalendar(
               rowHeight: 50,
            headerStyle: const HeaderStyle (formatButtonVisible: false, titleCentered: true),


              focusedDay: today,
              firstDay:DateTime.utc(2010,10,16),
              lastDay:DateTime.utc(2030,3,14)
              
              ),
          )
        ],
      );
    }
  }
