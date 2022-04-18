import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:research_alert/core/models/notes_model.dart';
import 'package:research_alert/core/services/database_services.dart';
import 'package:research_alert/core/services/notification_service.dart';
import 'package:research_alert/core/utils/alert_dialog.dart';
import 'package:research_alert/ui/screens/home_screen.dart';
import 'package:research_alert/ui/screens/third_screen.dart';

class UpdateBookmarkScreen extends StatefulWidget {
  Notes notes;
  DocumentReference ref;

  UpdateBookmarkScreen({required this.notes, required this.ref});

  @override
  State<UpdateBookmarkScreen> createState() => _UpdateBookmarkScreenState();
}

class _UpdateBookmarkScreenState extends State<UpdateBookmarkScreen> {
  DataBaseServices _dataBaseServices = DataBaseServices();

  NotificationService _notificationService = NotificationService();

  TextEditingController _titleC = TextEditingController();
  TextEditingController _descC = TextEditingController();

  bool isBold = false;
  bool isLoading = false;

  DateTime? dateTime;

  @override
  void initState() {
    super.initState();

    NotificationService.init();
    // listenNotification();

    _titleC.text = widget.notes.title;
    _descC.text = widget.notes.desc;
    dateTime = widget.notes.reminder.toDate();
  }

  // listenNotification() {
  //   NotificationService.onNotifications.stream.listen(onClickedNotification);
  // }
  //
  // onClickedNotification(String? payload) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => ThirdScreen(payload: payload),
  //       ));
  // }

  toggleLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  String getFormattedDataTime(DateTime dateTime) {
    final myDateTime =
        DateTime.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch);

    var formattedDate = DateFormat('dd MMM yyyy  hh:mm a').format(myDateTime);

    return formattedDate;
  }

  onConfirmDateTime(DateTime dateTimeIs) {
    FocusScope.of(context).unfocus();
    setState(() {
      dateTime = dateTimeIs;
    });

    final mydateTime =
        DateTime.fromMillisecondsSinceEpoch(dateTime!.millisecondsSinceEpoch);

    var formattedDate = DateFormat('dd MMM yyyy  hh:mm a').format(mydateTime);

    print('date in human read $formattedDate');
  }

  Future<void> handleScheduleNotification() async {
    try {
      await _notificationService.showScheduledNotification(
        title: _titleC.text,
        body: _descC.text,
        payload: 'def',
        // scheduleDateTime:
        //     DateTime.now().add(Duration(seconds: 3)),
        scheduleDateTime: dateTime,
      );

      // showAlertDialog(context, 'Notification', 'Scheduled');
    } catch (e) {
      print('Error ' + e.toString());
    }
  }

  updateBookmark() async {
    try {
      if (_titleC.text.isNotEmpty &&
          _descC.text.isNotEmpty &&
          dateTime != null) {
        toggleLoading(true);

        await handleScheduleNotification();

        await _dataBaseServices.updateBookMarksData(
            widget.ref, _titleC.text, _descC.text, dateTime!);

        toggleLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bookmark Updated Successfully'),
          ),
        );

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      } else {
        showAlertDialog(context, 'Error', 'Please Input all field');
      }
    } catch (e) {
      showAlertDialog(
          context, 'Error', 'Some error occurred while updating data');
    }
  }

  @override
  Widget build(BuildContext context) {
    const textStyleBold = const TextStyle(fontWeight: FontWeight.bold);
    var width = MediaQuery.of(context).size.width / 2;

    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black45,
              ),
            ),
            title: const Text(
              'Update Bookmark',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 15.0),
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

                        GestureDetector(
                          onTap: () {
                            DatePicker.showDateTimePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime(2022, 12, 31),
                              // onChanged: (date) {
                              //   print('change $date');
                              // },
                              onConfirm: onConfirmDateTime,
                              currentTime: DateTime.now(),
                              locale: LocaleType.en,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: ListTile(
                              title: dateTime != null
                                  ? Text(getFormattedDataTime(dateTime!))
                                  : Text(''),
                              trailing: Icon(Icons.schedule_outlined),
                            ),
                          ),
                        ),

                        // ElevatedButton(
                        //     onPressed: () {
                        //       DatePicker.showDateTimePicker(
                        //         context,
                        //         showTitleActions: true,
                        //         minTime: DateTime.now(),
                        //         maxTime: DateTime(2022, 12, 31),
                        //         // onChanged: (date) {
                        //         //   print('change $date');
                        //         // },
                        //         onConfirm: onConfirmDateTime,
                        //         currentTime: DateTime.now(),
                        //         locale: LocaleType.en,
                        //       );
                        //     },
                        //     child: Text(
                        //       'Show DateTime Picker',
                        //     ),),

                        // ElevatedButton(
                        //     onPressed: handleScheduleNotification,
                        //     child: Text('Schedule Notification')),
                        SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: updateBookmark,
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(width, 40)),
                          ),
                          child: Text('Update Bookmark'),
                        ),

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
      ),
    );
  }
}