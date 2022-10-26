import 'package:form_app/app/data/model/steps.dart';
import 'package:form_app/app/data/providers/local/json_data_provider.dart';
import 'package:get/get.dart';

class JSONDataRepository {
  final JSONDataProvider _api = Get.find<JSONDataProvider>();
  Future<Steps> getJSONData() async {
    return await _api.getJSONData();
  }
}
