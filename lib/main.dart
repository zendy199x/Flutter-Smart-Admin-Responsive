import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_admin/core/constants/color_constants.dart';
import 'package:smart_admin/core/init/provider_list.dart';
import 'package:smart_admin/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

Widget build(BuildContext context) {
  return MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: FutureBuilder(
      builder: (context, snapshot) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Dashboard - Admin Panel v0.1 ',
      theme: ThemeData(
        fontFamily: "Poppins",
        appBarTheme: const AppBarTheme(backgroundColor: bgColor, elevation: 0),
        scaffoldBackgroundColor: bgColor,
        primaryColor: greenColor,
        dialogBackgroundColor: secondaryColor,
        // ignore: deprecated_member_use
        buttonColor: greenColor,
        canvasColor: secondaryColor,
      ),
      home: const Login(title: "Wellcome to the Admin & Dashboard Panel"),
    );
  }
}
