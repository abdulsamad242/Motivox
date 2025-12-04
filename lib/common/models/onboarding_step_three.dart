import 'dart:convert';

class OnboardingScreenThree {
  final String status;
  final String metaVersion;
  final OnboardingStep3 meta;

  OnboardingScreenThree({
    required this.status,
    required this.metaVersion,
    required this.meta,
  });

  factory OnboardingScreenThree.fromJson(Map<String, dynamic> json) {
    return OnboardingScreenThree(
      status: json["status"] ?? "",
      metaVersion: json["meta_version"] ?? "",
      meta: OnboardingStep3.fromJson(
        json["meta_json"]["onboarding_step3"],
      ),
    );
  }
}

class OnboardingStep3 {
  final String heading;
  final String tagline;
  final String missionTitle;
  final String missionExample;
  final String visionTitle;
  final String visionExample;
  final OnboardingStep3Form form;

  OnboardingStep3({
    required this.heading,
    required this.tagline,
    required this.missionTitle,
    required this.missionExample,
    required this.visionTitle,
    required this.visionExample,
    required this.form,
  });

  factory OnboardingStep3.fromJson(Map<String, dynamic> json) {
    return OnboardingStep3(
      heading: json["heading"] ?? "",
      tagline: json["tagline"] ?? "",
      missionTitle: json["mission_title"] ?? "",
      missionExample: json["mission_example"] ?? "",
      visionTitle: json["vision_title"] ?? "",
      visionExample: json["vision_example"] ?? "",
      form: OnboardingStep3Form.fromJson(json["form"]),
    );
  }
}

class OnboardingStep3Form {
  final String name;
  final List<FormFieldItem> fields;

  OnboardingStep3Form({
    required this.name,
    required this.fields,
  });

  factory OnboardingStep3Form.fromJson(Map<String, dynamic> json) {
    return OnboardingStep3Form(
      name: json["name"] ?? "",
      fields: (json["fields"] as List)
          .map((e) => FormFieldItem.fromJson(e))
          .toList(),
    );
  }
}

class FormFieldItem {
  final String type;
  final String label;
  final String name;
  final String? placeholder;
  final FieldValidation? validation;
  final FieldAction? action;

  FormFieldItem({
    required this.type,
    required this.label,
    required this.name,
    this.placeholder,
    this.validation,
    this.action,
  });

  factory FormFieldItem.fromJson(Map<String, dynamic> json) {
    return FormFieldItem(
      type: json["type"] ?? "",
      label: json["label"] ?? "",
      name: json["name"] ?? "",
      placeholder: json["placeholder"],
      validation: json["validation"] != null
          ? FieldValidation.fromJson(json["validation"])
          : null,
      action: json["action"] != null
          ? FieldAction.fromJson(json["action"])
          : null,
    );
  }
}

class FieldValidation {
  final bool? requiredField;
  final int? minLength;
  final int? maxLength;

  FieldValidation({
    this.requiredField,
    this.minLength,
    this.maxLength,
  });

  factory FieldValidation.fromJson(Map<String, dynamic> json) {
    return FieldValidation(
      requiredField: json["required"],
      minLength: json["min_length"],
      maxLength: json["max_length"],
    );
  }
}

class FieldAction {
  final String type;
  final String apiUrl;
  final String? method;

  FieldAction({
    required this.type,
    required this.apiUrl,
    this.method,
  });

  factory FieldAction.fromJson(Map<String, dynamic> json) {
    return FieldAction(
      type: json["type"] ?? "",
      apiUrl: json["api_url"] ?? "",
      method: json["method"],
    );
  }
}
