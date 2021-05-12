
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeDropDown extends StatefulWidget {
  const TimeDropDown({Key key}) : super(key: key);

  @override
  _TimeDropDownState createState() => _TimeDropDownState();
}

class _TimeDropDownState extends State<TimeDropDown> {
  // Default Drop Down Item.
  String dropdownValue = '9:00AM';

  // To show Selected Item in Text.
  String holder = '' ;

  List <String> timeSlots = [
    '9:00AM',
    '9:30AM',
    '10:00AM',
    '10:30AM',
    '11:00AM'
  ] ;

  void getDropDownItem(){

    setState(() {
      holder = dropdownValue ;
      print(holder);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            TextButton(
              child: Text('Start Time:', style: TextStyle(fontSize: 15,color: Colors.black),),
              onPressed: getDropDownItem,

            ),
            SizedBox(width: 10,),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 20,
              elevation: 16,
              style: TextStyle(color: Colors.blue, fontSize: 12),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              onChanged: (String data) {
                setState(() {
                  dropdownValue = data;
                });
              },
              items: timeSlots.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

          ],
        ),
Text("selected item is : ${dropdownValue}"),





      ],
    );
  }
}
