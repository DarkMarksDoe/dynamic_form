import 'package:flutter/material.dart';
import 'package:form_app/app/modules/home/home_controller.dart';
import 'package:form_app/app/modules/home/widgets/single_choice_item.dart';
import 'package:form_app/app/modules/home/widgets/text_choice_item.dart';
import 'package:form_app/app/utils/enum_utils.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Step: ${Get.find<HomeController>().currentStep}'),
        ),
        body: GetBuilder<HomeController>(builder: (controller) {
          return Center(
            child: Builder(
              builder: (BuildContext context) {
                if (controller.isLoading) {
                  return const CircularProgressIndicator();
                } else {
                  if (controller.steps?.steps[controller.currentStep].stepType ==
                      QuestionsEnum.unique) {
                    return SingleChoiceItem(step: controller.steps?.steps[controller.currentStep], isHome : true);
                  }
                  if (controller.steps?.steps[controller.currentStep].stepType ==
                      QuestionsEnum.text) {
                    return TextChoiceItem(step: controller.steps?.steps[controller.currentStep], isHome: true);
                  }
                  return const Center();
                }
              },
            ),
          );
        }),
      ),
    );
  }
}
