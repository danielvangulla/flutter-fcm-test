library testv3_10.fcm;

import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

String? fcmToken = '';
String keyPair =
    'BMvHns84Vtp4spcDv8R0rXdsRtb2YTGSw-5IzGIawnNXUAbzexo02QkNWjPTrCtAE8fdquNKnYN-mx2F71lCh5Q';

class MyFirebase {
  static getFcmToken() async {
    fcmToken = await FirebaseMessaging.instance.getToken();
    if (kDebugMode) {
      print("TOKEN: $fcmToken");
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      fcmToken = token;
    }).onError((err) {
      log(err);
    });

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }
}
