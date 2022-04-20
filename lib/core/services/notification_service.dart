import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotificationService {
  final _localNotifications = FlutterLocalNotificationsPlugin();

  static final onNotifications = BehaviorSubject<String?>();

  static Future init() async {
    tz.initializeTimeZones();
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final ios = IOSInitializationSettings();

    final settings = InitializationSettings(
      android: android,
      iOS: ios,
    );

    await FlutterLocalNotificationsPlugin().initialize(settings,
        onSelectNotification: (payload) async {
      print('notification clicked');
      onNotifications.add(payload);
    });
  }

  Future<NotificationDetails> _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
        // priority: Priority.high,
        ticker: 'ticker',
        ongoing: true,
        styleInformation: BigTextStyleInformation(''),
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  // Future showNotification(
  //     {int id = 0, String? title, String? body, String? payload}) async {
  //   //show notification
  //   _localNotifications.show(id, title, body, await _notificationDetails(),
  //       payload: payload);
  // }

  Future showScheduledNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required scheduleDateTime}) async {
    //show notification
    _localNotifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduleDateTime, tz.local),
      await _notificationDetails(),
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
