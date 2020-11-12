import 'package:flutter/material.dart';
import 'package:age/age.dart';
class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  DateTime dateTime;

  DateTime toDayDate = DateTime.now();
  AgeDuration age;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "calender",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          backgroundColor: Colors.teal,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SizedBox(height: 20,),
            Text(dateTime == null
                ? "nothing has been picked yet "
                : "your age is $age"),
            SizedBox(height: 20,),
            RaisedButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1940),
                        lastDate: DateTime(2021))
                    .then((date) {
                  setState(() {

                    var different = toDayDate.difference(date).inDays;
                    dateTime = date;
                    age = Age.dateDifference(fromDate: date, toDate: toDayDate);


                  });
                });
              },
              child: Text("pick date"),
            ),
            //Text("your age is$age"),
          ],
        ),
      ),
    );
  }
}
