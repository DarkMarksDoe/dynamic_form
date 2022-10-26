import 'package:flutter/material.dart';
import 'package:form_app/app/app.dart';
import 'package:form_app/app/utils/dependency_injection.dart';

void main() {
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const FormApp();
  }
}
