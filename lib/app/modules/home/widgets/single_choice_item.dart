import 'package:flutter/material.dart';
import 'package:form_app/app/data/model/step.dart' as custom_step;
import 'package:form_app/app/modules/home/home_controller.dart';
import 'package:form_app/app/widgets/solid_button.dart';
import 'package:get/get.dart';

class SingleChoiceItem extends StatelessWidget {
  const SingleChoiceItem({super.key, required this.step, this.isHome = false});
  final custom_step.Step? step;
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                step!.prompt,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 80),
              DropdownButton<String>(
                value: step!.options.first,
                items: step!.options.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (newValue) {
                  controller.currentSingleValue = newValue!;
                },
              ),
              const Spacer(),
              SolidButton(
                action: () => controller.goToNextStep(),
                text: 'Next',
              ),
            ],
          ),
        );
      },
    );
  }
}
