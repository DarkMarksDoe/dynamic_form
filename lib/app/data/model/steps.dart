import 'package:form_app/app/data/model/step.dart';

class Steps {
  Steps({
    required this.steps,
  });
  final List<Step> steps;
  factory Steps.fromJSON(Map<String, dynamic> json) {
    return Steps(
      steps: List<Step>.from(json['Steps'].map((x) => Step.fromMap(x))),
    );
  }
}
