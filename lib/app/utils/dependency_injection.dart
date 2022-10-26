import 'package:form_app/app/data/providers/local/json_data_provider.dart';
import 'package:form_app/app/data/repositories/local/json_data_repository.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() async {
    //Providers
    Get.put<JSONDataProvider>(JSONDataProvider());

    // Repositories
    Get.put<JSONDataRepository>(JSONDataRepository());
  }
}
