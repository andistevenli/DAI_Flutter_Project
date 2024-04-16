import 'package:dai_sales/feature/report/report_controller.dart';
import 'package:dai_sales/feature/report/report_screen.dart';
import 'package:dai_sales/feature/upload-file/upload_file_screen.dart';
import 'package:dai_sales/util/constant/route.dart';
import 'package:dai_sales/util/constant/text.dart';
import 'package:dai_sales/util/key/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const DAISalesApp());
}

class DAISalesApp extends StatelessWidget {
  const DAISalesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ReportController(),
        ),
      ],
      child: MaterialApp(
        title: projectName,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: uploadFileRoute,
        routes: {
          uploadFileRoute: (context) => const UploadFileScreen(),
          reportRoute: (context) => const ReportScreen(),
        },
      ),
    );
  }
}
