import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotiService {
  final notifactionPlugin = FlutterLocalNotificationsPlugin();

  bool _isInit = false;

  bool get isInit => _isInit;
  // Init
  Future<void> initNotifaction() async {
    if (_isInit) return;

    //prepare the android init
    const initSettingAndroid =
        AndroidInitializationSettings('@mipmap/ic_lancher');

    // init setting
    const initSetting = InitializationSettings(android: initSettingAndroid);

// finally init the plugin
    await notifactionPlugin.initialize(initSetting);
  }

  //Notifaction details
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            'daily_channel_id', 'Daily Notification',
            channelDescription: 'Daily Notification Channel',
            importance: Importance.max,
            priority: Priority.high));
  }

  // Show Notification
  Future<void> showNotification({
    int  id = 0,
    String? title,
    String? body,
  }) async {
    return notifactionPlugin.show(id, title, body, const NotificationDetails());
  }
}
