import 'package:dai_sales/feature/home/home_screen.dart';
import 'package:dai_sales/feature/report/report_controller.dart';
import 'package:dai_sales/feature/report/report_screen.dart';
import 'package:dai_sales/feature/upload-file/upload_file_controller.dart';
import 'package:dai_sales/feature/upload-file/upload_file_screen.dart';
import 'package:dai_sales/utils/constant/route.dart';
import 'package:dai_sales/utils/constant/text.dart';
import 'package:dai_sales/utils/key/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const DAIApp());
}

class DAIApp extends StatelessWidget {
  const DAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ReportController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UploadFileController(),
        ),
      ],
      child: MaterialApp(
        title: projectName,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: homeRoute,
        routes: {
          homeRoute: (context) => const HomeScreen(),
          uploadFileRoute: (context) => const UploadFileScreen(),
          reportRoute: (context) => const ReportScreen(),
        },
      ),
    );
  }
}
