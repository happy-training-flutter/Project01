import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodapp/model/demo_list.dart';
import 'package:foodapp/model/note_model.dart';
import 'package:foodapp/pages/DashBoard.dart';
import 'package:foodapp/pages/NotesScreen.dart';
import 'package:foodapp/pages/localStorage01.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'firebase_options.dart';

// void main() {
//   runApp(GetMaterialApp(
//     initialRoute: '/dashboard',
//     routes: {
//       '/': (context) => Introscreen(),
//       '/signup': (context) => Signup(),
//       '/login': (context) => Login(),
//       '/dashboard': (context) => Dashboard(),
//       '/details': (context) => Details(),
//     }
//   ));
// }
//
// void main() {
//   runApp(GetMaterialApp(
//     initialRoute: '/dashboard',
//     getPages: [
//       GetPage(name: '/', page: () => Introscreen()),
//       GetPage(name: '/signup', page: () => Signup()),
//       GetPage(name: '/login', page: () => Login()),
//       GetPage(name: '/dashboard', page: () => Dashboard()),
//       GetPage(name: '/details', page: () => Details()),
//     ],
//   ));
// }
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFlutterNotifications();
  showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  print('foreground message received: ${message.messageId}');
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      id: 0,
      // notification.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: 'launch_background',
        ),
      ),
    );
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  await Hive.initFlutter();
  // Hive.registerAdapter(NoteModelAdapter());

  // await Hive.openBox<NoteModel>('notesBox');

  Hive.registerAdapter(DemoListModelAdapter());
  await Hive.openBox<DemoListModel>('demoListBox');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await FirebaseMessaging.instance.requestPermission();

  String? token = await FirebaseMessaging.instance.getToken();

  print("FCM Token: $token");


  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      home: Dashboard(),
      // home: NotesScreen()
    ),
  );
}
