import 'package:flutter/material.dart';
import 'dart:async';

import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:research_alert/core/services/database_services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();

  String? value;

  AddTodo({required this.value});
}

class _AddTodoState extends State<AddTodo> {
  DataBaseServices _dataBaseServices = DataBaseServices();

  TextEditingController _titleC = TextEditingController();
  TextEditingController _descC = TextEditingController();

  bool isBold = false;

  late DateTime dateTime;

  @override
  void initState() {
    super.initState();

    _descC.text = widget.value ?? '';
  }

  @override
  Widget build(BuildContext context) {
    const textStyleBold = const TextStyle(fontWeight: FontWeight.bold);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(''),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Title", style: textStyleBold),

                TextFormField(
                  controller: _titleC,
                  decoration: InputDecoration(
                      labelText: "Enter Title",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),

                SizedBox(height: 20),

                Text("Details", style: textStyleBold),
                // Text(_sharedText ?? ""),

                TextFormField(
                  maxLines: 25,
                  minLines: 8,
                  // textAlign: TextAlign.start,
                  controller: _descC,
                  decoration: InputDecoration(
                      labelText: "Enter Details",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime(2022, 12, 31), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (dateTimeIs) {
                        print('confirm $dateTimeIs');

                        setState(() {
                          dateTime = dateTimeIs;
                        });

                        print('dateTime ${dateTime.millisecondsSinceEpoch}');

                        final mydateTime = DateTime.fromMillisecondsSinceEpoch(
                            dateTime.millisecondsSinceEpoch);

                        var abc = DateFormat('dd MMM yyyy hh:mm:ss')
                            .format(mydateTime);

                        print('date in human read $abc');
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Text(
                      'Show DateTime Picker',
                    )),

                ElevatedButton(
                    onPressed: () async {
                      await _dataBaseServices.addData(
                          _titleC.text, _descC.text);
                    },
                    child: Text('Add Note')),

                // Text(
                //   'Hello',
                //   style: isBold
                //       ? TextStyle(fontWeight: FontWeight.bold)
                //       : TextStyle(fontWeight: FontWeight.normal),
                // ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
