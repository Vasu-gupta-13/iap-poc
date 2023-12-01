import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase_poc/auth/signin.dart';
import 'package:in_app_purchase_poc/firebase_auth/firebase_service.dart';
import 'package:in_app_purchase_poc/firebase_options.dart';
import 'package:in_app_purchase_poc/screens/homescreen/homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;
  String uid = '';
  @override
  void initState()  {
    uid = AuthFunctions().checkLogin(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: uid != ''? HomeScreen(uid: uid,): LoginPage(),
    );
  }
}

