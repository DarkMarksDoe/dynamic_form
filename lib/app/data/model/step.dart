import 'package:form_app/app/utils/enum_utils.dart';

class Step {
  Step({
    required this.stepId,
    required this.prompt,
    required this.stepType,
    required this.options,
    required this.nextSteps,
    required this.condition,
  });

  final String stepId;
  final String prompt;
  final QuestionsEnum stepType;
  final List<String> options;
  final List<Step> nextSteps;
  final Condition condition;

  factory Step.fromMap(Map<String, dynamic> json) {
    return Step(
      stepId: json['id'] ?? '',
      prompt: json['prompt'] ?? '',
      stepType: getEnum(json),
      options: List<String>.from(json['options'] ?? [].map((x) => x)),
      nextSteps: (json['nextSteps'] == null) ? [] : getNextSteps(json),
      condition: getCondition(json),
    );
  }

  static Condition getCondition(Map<String, dynamic> json) {
    if (json['condition'] == null) {
      return Condition(leftOperator: '', operator: '', rightOperator: '');
    } else {
      Condition condition = Condition.fromMap(json['condition']);
      return condition;
    }
  }

  static getNextSteps(Map<String, dynamic> json) {
    if (json['nextSteps'] == null || json['nextSteps'] == {}) {
      return [];
    } else {
      return List<Step>.from(json['nextSteps'].map((x) => Step.fromMap(x)));
    }
  }

  static getEnum(Map<String, dynamic> json) {
    if(json['type'] == null){
      return QuestionsEnum.text;
    }
    if (json['type'] == 'TextQuestion') {
      return QuestionsEnum.text;
    }
    if (json['type'] == 'SingleChoice') {
      return QuestionsEnum.unique;
    }
    if (json['type'] == 'DateQuestion') {
      return QuestionsEnum.date;
    }
    if (json['type'] == 'NumberQuestion') {
      return QuestionsEnum.number;
    }
    if (json['type'] == 'Multiple Choice') {
      return QuestionsEnum.options;
    }
    return QuestionsEnum.text;
  }
}

class Condition {
  Condition({
    required this.leftOperator,
    required this.operator,
    required this.rightOperator,
  });

  final String leftOperator;
  final String operator;
  final String rightOperator;

  factory Condition.fromMap(Map<String, dynamic> json) {
    return Condition(
      leftOperator: json['left'].toString(),
      operator: json['operator'].toString(),
      rightOperator: json['right'].toString(),
    );
  }
}
