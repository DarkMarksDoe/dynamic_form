import 'package:flutter/material.dart';
import 'package:form_app/app/modules/home/home_binding.dart';
import 'package:form_app/app/routes/app_pages.dart';
import 'package:form_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'form App',
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}
