import 'package:flycar/pages/calendar_page/calendar_widgets/utils.dart';
import 'package:flycar/pages/car_details/singleton.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import '/api/fetchData.dart';
import 'package:flycar/sharedPrefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/async.dart';
import 'dart:convert';
import 'dart:async';
class CalendarSelectionRange extends StatefulWidget {
  @override
  _CalendarSelectionRangeState createState() => _CalendarSelectionRangeState();
}

class _CalendarSelectionRangeState extends State<CalendarSelectionRange> {
  final _servicio = new ServicioSingleton();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  late Duration _difference;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      //shouldFillViewport: true,
      rowHeight: 45,
      availableGestures: AvailableGestures.verticalSwipe,
      calendarStyle: CalendarStyle(),

      locale: 'en_US',
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(DateTime.now(), day),
      rangeStartDay: _rangeStart,
      rangeEndDay: _rangeEnd,
      rangeSelectionMode: _rangeSelectionMode,

      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
            _rangeStart = null; // Important to clean those
            _rangeEnd = null;
            _rangeSelectionMode = RangeSelectionMode.toggledOff;
          });
        }
      },

      onRangeSelected: (start, end, focusedDay) {
        setState(() {
          _selectedDay = DateTime.now();
          _focusedDay = focusedDay;
          _servicio.diaINICIO.value = start!;
          _servicio.diaFIN.value = end!;
          _rangeStart = start;
          _rangeEnd = end;
          _rangeSelectionMode = RangeSelectionMode.toggledOn;
        });

        if (end != null && start != null) {
          _difference = end.difference(start);
          _servicio.diasTOTALES = _difference.inDays + 1.toInt();
        } else
          return;
        print('Start $_rangeStart');
        //var formate2 = "${_rangeStart.year}-${_rangeStart.month}-${_rangeStart.day}";
        print('End $_rangeEnd');
        print('total days ${_servicio.diasTOTALES}');
        String StartStr= '${start.year}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')} ';
    String EndStr= '${end.year}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')} ';
    //String totalStr=_servicio.diasTOTALES.toString as String;
        //sharedPrefs.saveDates(StartStr,EndStr,totalStr);
          sharedPrefs.saveDates(StartStr,EndStr,'${_servicio.diasTOTALES}');
       // datesDB(_rangeStart!,_rangeEnd!);
      },

      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },

      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },

    );
    
  }
}

void CarsOutdatesDB(DateTime start, DateTime end) async {
try{
 print("inside 1");
 String StartStr= '${start.year}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')} ';
    String EndStr= '${end.year}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')} ';
      http.Response res = await http.get(
        //192.168.1.55 // 172.19.222.186
          Uri.parse(fetchData.baseURL+'/carRentDate?id='+'2' +'&&carid='+'2'+'&&userID=' +'2'+'&&startDate='+StartStr+
              '&&endDate='+EndStr),
              
          headers: {'Content-Type': 'application/json'});
           print("inside 2");
  //}
    } catch (e) {
      print("no register");
    }
  }



void datesDB(DateTime start, DateTime end) async {
try{
 print("inside 1");
 String convertStartToString= '${start.year}-'
'${start.month.toString().padLeft(2, '0')}-'
    '${start.day.toString().padLeft(2, '0')} ';
    String convertEndToString= '${end.year}-'
'${end.month.toString().padLeft(2, '0')}-'
    '${end.day.toString().padLeft(2, '0')} ';
      http.Response res = await http.get(
        //192.168.1.55 // 172.19.222.186
          Uri.parse(fetchData.baseURL+'/carRentDate?id='+'2' +'&&carid='+'2'+'&&userID=' +'2'+'&&startDate='+convertStartToString +
              '&&endDate='+convertEndToString),
              
          headers: {'Content-Type': 'application/json'});
           print("inside 2");
  //}
    } catch (e) {
      print("no register");
    }
  }

