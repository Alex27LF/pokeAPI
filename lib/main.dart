import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_api/src/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (build, context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Guía Pokémon',
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        home: const HomePage(),
      ),
    );
  }
}
