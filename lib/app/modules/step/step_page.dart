import 'package:flutter/material.dart';
import 'package:form_app/app/modules/home/home_controller.dart';
import 'package:form_app/app/modules/home/widgets/single_choice_item.dart';
import 'package:form_app/app/modules/home/widgets/text_choice_item.dart';
import 'package:form_app/app/utils/enum_utils.dart';
import 'package:get/get.dart';

class StepPage extends StatelessWidget {
  const StepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Step: ${Get.find<HomeController>().currentStep}'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_outlined),
              tooltip: 'Open shopping cart',
              onPressed: () {
                Get.find<HomeController>().goBack();
                Get.back();
              },
            ),
          ),
          body: GetBuilder<HomeController>(builder: (controller) {
            return Center(
              child: Builder(
                builder: (BuildContext context) {
                  if (controller.steps?.steps[controller.currentStep].stepType ==
                      QuestionsEnum.text) {
                    return TextChoiceItem(
                      step: controller.steps?.steps[controller.currentStep],
                    );
                  }
                  if (controller.steps!.steps[controller.currentStep].stepType ==
                      QuestionsEnum.unique) {
                    return SingleChoiceItem(
                      step: controller.steps?.steps[controller.currentStep],
                    );
                  }
                  return const Center();
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
