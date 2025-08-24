// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotiService {
//   final notifactionPlugin = FlutterLocalNotificationsPlugin();

//   bool _isInit = false;

//   bool get isInit => _isInit;
//   // Init
//   Future<void> initNotifaction() async {
//     if (_isInit) return;

//     //prepare the android init
//     const initSettingAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     // init setting
//     const initSetting = InitializationSettings(android: initSettingAndroid);

// // finally init the plugin
//     await notifactionPlugin.initialize(initSetting);
//   }

//   //Notifaction details
//   NotificationDetails notificationDetails() {
//     return const NotificationDetails(
//       android: AndroidNotificationDetails(
//           'daily_channel_id', 'Daily Notification',
//           channelDescription: 'Daily Notification Channel',
//           importance: Importance.max,
//           priority: Priority.high),
//     );
//   }

//   // Show Notification
//   Future<void> showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//   }) async {
//     return notifactionPlugin.show(id, title, body, const notificationDetails());
//   }
// }
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();
  bool _isInit = false;

  bool get isInit => _isInit;

  Future<void> initNotification() async {
    if (_isInit) return;

    // إعداد Android (تأكد أيقونة اللانشر موجودة)
    const initSettingAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // إعداد عام
    const initSetting = InitializationSettings(android: initSettingAndroid);

    // تهيئة
    await notificationPlugin.initialize(initSetting);

    // طلب صلاحية الإشعارات (مطلوبة من Android 13 وفوق)
    final androidPlugin =
        notificationPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.requestNotificationsPermission();

    _isInit = true;
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id', // لازم يكون ثابت ومميز
        'Daily Notification',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationPlugin.show(id, title, body, notificationDetails());
  }
}
