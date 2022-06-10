import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yurutecrobot/Export.dart';
import 'package:yurutecrobot/Pages/OnBoardPage/OnBoardPage.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QTR TECH',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: OnBoard(),
    );
  }
}
