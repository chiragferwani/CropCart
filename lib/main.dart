import 'package:flutter/material.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:grocery_shop_app/pages/intro_page.dart';
import 'package:grocery_shop_app/pages/splash.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//global object for accessing device screen size
late Size mq;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initNotifications();  // ⚡ Initialize notifications
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      )
    );
  }
}
