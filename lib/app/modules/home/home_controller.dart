import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_app/app/data/model/steps.dart';
import 'package:form_app/app/data/repositories/local/json_data_repository.dart';
import 'package:form_app/app/modules/step/step_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final JSONDataRepository _jsonDataRepository = Get.find<JSONDataRepository>();

  final TextEditingController singleTextController = TextEditingController();

  bool isLoading = true;
  Steps? steps;
  int currentStep = 0;

  String currentSingleValue = '';

  Map<String, dynamic> selectedOptions = {};

  @override
  void onInit() async {
    super.onInit();
    steps = await _jsonDataRepository.getJSONData();
    if (kDebugMode) {
      print(steps?.steps.length);
    }
    isLoading = false;
    update();
  }

  void goToNextStep() {
    currentStep++;
    print('Home Step: $currentStep');
    Get.dialog(const StepPage(), useSafeArea: true, barrierDismissible: false);
  }

  void verifyNextSteps(){

  }

  void goBack() {
    currentStep--;
  }
}
