import 'package:form_app/app/modules/home/home_binding.dart';
import 'package:form_app/app/modules/home/home_page.dart';
import 'package:form_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
