import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phoneauth/app/widget/multi_bloc_provider.wrapper.dart';
import 'package:phoneauth/pages/pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.auth}) : super(key: key);

  final FirebaseAuth auth;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocWrapper(
        auth: auth,
        child: MyHomePage(
          auth: auth,
        ),
      ),
    );
  }
}
