import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscription_management/core/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subscription_management/view/screen/home.dart';
import 'package:subscription_management/controllers/MenuAppController.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel || لوحة الادارة',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) =>  MenuAppController(),
          ),
        ],
        child: Home(),
      ),
    );
  }
}
