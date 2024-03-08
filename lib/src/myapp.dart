import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_api/src/infrastructure/routes/route_names.dart';
import 'package:todo_api/src/infrastructure/routes/route_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.homePageRoute,
      getPages: RoutePages.getPages,
    );
  }
}
