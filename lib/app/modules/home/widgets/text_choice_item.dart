import 'package:flutter/material.dart';
import 'package:form_app/app/data/model/step.dart' as custom_step;
import 'package:form_app/app/modules/home/home_controller.dart';
import 'package:form_app/app/widgets/solid_button.dart';
import 'package:get/get.dart';

class TextChoiceItem extends StatelessWidget {
  const TextChoiceItem({super.key, required this.step, this.isHome = false});
  final custom_step.Step? step;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            step!.prompt,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 80),
          TextField(
            controller: Get.find<HomeController>().singleTextController,
            decoration: InputDecoration(
              hintText: 'Enter your name',
              counterText: "",
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const Spacer(),
          SolidButton(
            action: () => Get.find<HomeController>().goToNextStep(),
            text: 'Next',
          ),
        ],
      ),
    );
  }
}
