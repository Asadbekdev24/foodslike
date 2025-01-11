import 'package:flutter/material.dart';
import 'package:flutter_application_liked/logic/change_screen_provider.dart';
import 'package:flutter_application_liked/model/data_repo.dart';
import 'package:flutter_application_liked/presentatation/screens/home.dart';
import 'package:flutter_application_liked/presentatation/screens/home2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      splitScreenMode: true,
      child: ChangeNotifierProvider(
        create: (context) => ChangeScreenProvider(DataRepo()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
