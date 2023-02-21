import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class LocalNotification {
  static Future<void> showNotification(RemoteMessage payload) async {
    // Parsing ID Notifikasi
    final int idNotification =
        payload.data['id'] != null ? int.parse(payload.data['id']) : 1;

    // Daftar jenis notifikasi dari aplikasi.
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'BBD',
      'Notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails initializationSettingsDarwin =
        DarwinNotificationDetails();

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: initializationSettingsDarwin,
    );

    // Menampilkan Notifikasi
    await flutterLocalNotificationsPlugin.show(
      idNotification,
      payload.notification?.title,
      payload.notification?.body,
      platformChannelSpecifics,
      payload: jsonEncode(payload.data),
    );
  }

  Future<void> notificationHandler() async {
    // Pengaturan Notifikasi

    // AndroidInitializationSettings default value is 'app_icon'
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_stat_ic_notification');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    // Handling notifikasi yang di tap oleh pengguna
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }
}
