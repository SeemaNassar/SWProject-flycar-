import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: celebookrent(title: 'Flutter Demo Home Page'),
    );
  }
}

class celebookrent extends StatefulWidget {
  celebookrent({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _celebookrentState createState() => _celebookrentState();
}

class _celebookrentState extends State<celebookrent> {
  DateRangePickerController _datePickerController = DateRangePickerController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfDateRangePicker(
        view: DateRangePickerView.month,
       extendableRangeSelectionDirection:ExtendableRangeSelectionDirection.forward,
        monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
        selectionMode: DateRangePickerSelectionMode.multiRange,
       // enableMultiView: SfDateRangePicker(minDate: ,),
        //onSelectionChanged: _onSelectionChanged,
        showActionButtons: true,
        controller: _datePickerController,
        // onSubmit: (Object val) {
        //   print(val);
        // },
        onCancel: () {
          _datePickerController.selectedRanges = null;
        },
      ),
    ));
  }

  // void _onSelectionChanged(
  //     DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
  //   print(dateRangePickerSelectionChangedArgs.value);
  // }
}
