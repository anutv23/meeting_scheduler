import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:project_calendar_app/timeDropDown.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';

import 'clientTypeDropDown.dart';
import 'endTimeDropDown.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool pressed = false;
  bool pressedstart = false;
  DateTime selectedDateTime;
  TimeOfDay _startTime;
  TimeOfDay _endTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[400],
        centerTitle: true,
        title: Text(
          "Meeting Scheduler",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                  elevation: 3.0,
                  shadowColor: Colors.grey,
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 370,
                    width: 600,
                  //  color: Colors.yellow,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 8.0, top: 10),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(30)),
                                  shadowColor: Colors.grey,
                                  elevation: 10.0,
                                  margin: EdgeInsets.fromLTRB(
                                      5.0, 10.0, 160.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 2),
                                    child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            DatePicker.showDatePicker(context,
                                                showTitleActions: true,
                                                onConfirm: (date) {
                                                  setState(() {
                                                    pressed = true;
                                                    selectedDateTime = date;
                                                  });
                                                }, currentTime: DateTime.now());
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              'Select Date:',
                                              style: TextStyle(fontSize: 15,color: Colors.black),
                                            ),
                                            SizedBox(width: 20),
                                            pressed
                                                ? _displayDateTime(
                                                selectedDateTime)
                                                : Text("DD/MM/YYYY", style: TextStyle(fontSize: 12),),
                                          ],
                                        )),
                                  )),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(30)),
                                  shadowColor: Colors.grey,
                                  elevation: 10.0,
                                  margin: EdgeInsets.fromLTRB(
                                      5.0, 10.0, 150.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 2
                                    ),
                                    child: TimeDropDown(),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(30)),
                                  shadowColor: Colors.grey,
                                  elevation: 10.0,
                                  margin: EdgeInsets.fromLTRB(
                                      5.0, 10.0, 150.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 2
                                    ),
                                    child: endTimeDropDown(),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(30)),
                                  shadowColor: Colors.grey,
                                  elevation: 10.0,
                                  margin: EdgeInsets.fromLTRB(
                                      5.0, 10.0, 150.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 2
                                    ),
                                    child: ClientType(),
                                  )),
                            ),
                          ],
                        ),

                      ],

                    ),
                    //  color: Colors.yellow
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 5,
                shadowColor: Colors.amber,
                child: Container(
                  height: 200,
                  width: 600,
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      Text("Meeting is scheduled with: on: \n at: to:")
                    ],

                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _displayDateTime(selectedDateTime) {
  return Text(
      '${selectedDateTime.day} / ${selectedDateTime.month} / ${selectedDateTime.year}',
      style: TextStyle(fontSize: 12));
}
