import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';


class notificationHome extends StatefulWidget {
  final String title;
  const notificationHome({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _notificationHomeState();
}

class _notificationHomeState extends State<notificationHome> {
  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'test_noti_1', // Unique channel ID
          'Notification Test', // Visible channel name
          channelDescription: 'Channel for app',
          importance: Importance.max,/// bắt buộc hiển thị thông báo
          priority: Priority.high, /// ưu tiên hiển thị thông báo
        );

    // For iOS, you can add additional configuration
    // inside DarwinNotificationDetails
    // For this example, we use the Android-specific details
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,/// gộp các chi tiết thông báo cho Android
    );

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID.
      'Hello!', // Notification title.
      'Button pressed notification', // Notification body.
      platformChannelSpecifics,
      payload: 'Default_Sound', // Optional payload.
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          onPressed: _showNotification,
          child: const Text('Send Notification'),
        ),
      ),
    );
  }
}
