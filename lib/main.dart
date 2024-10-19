import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rentcar/firebase_options.dart';
import 'package:rentcar/presentation/pages/car_details_page.dart';
import 'package:rentcar/presentation/pages/car_list_screen.dart';

import 'presentation/pages/onboarding_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CarDetailsPage(),
    );
  }
}


/// Function to log a custom event in Firebase Analytics
Future<void> logCustomEvent() async {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  try {
    await analytics.logEvent(
      name: 'custom_event',
      parameters: <String, Object>{
        'event_name': 'Test Event',
        'event_category': 'Test Category',
        'value': 123, // Ensure this is of type int, double, String, or bool (valid Object types)
      },
    );
    print('Custom event logged successfully');
  } catch (e) {
    print('Failed to log custom event: $e');
  }
}

