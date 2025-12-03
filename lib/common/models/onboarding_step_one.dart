import 'dart:convert';

class OnboardingScreenOne {
  final String status;
  final String metaVersion;
  final OnboardingStep1 meta;

  OnboardingScreenOne({
    required this.status,
    required this.metaVersion,
    required this.meta,
  });

  factory OnboardingScreenOne.fromJson(Map<String, dynamic> json) {
    return OnboardingScreenOne(
      status: json["status"] ?? "",
      metaVersion: json["meta_version"] ?? "",
      meta: OnboardingStep1.fromJson(json["meta_json"]["onboarding_step1"]),
    );
  }
}

class OnboardingStep1 {
  final String welcomeMessage;
  final String tagline;
  final String title;
  final OnboardingForm form;

  OnboardingStep1({
    required this.welcomeMessage,
    required this.tagline,
    required this.title,
    required this.form,
  });

  factory OnboardingStep1.fromJson(Map<String, dynamic> json) {
    return OnboardingStep1(
      welcomeMessage: json["welcome_message"] ?? "",
      tagline: json["tagline"] ?? "",
      title: json["title"] ?? "",
      form: OnboardingForm.fromJson(json["form"]),
    );
  }
}

class OnboardingForm {
  final String name;
  final List<FormFieldItem> fields;

  OnboardingForm({required this.name, required this.fields});

  factory OnboardingForm.fromJson(Map<String, dynamic> json) {
    return OnboardingForm(
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
  final String? type;

  FieldValidation({
    this.requiredField,
    this.minLength,
    this.maxLength,
    this.type,
  });

  factory FieldValidation.fromJson(Map<String, dynamic> json) {
    return FieldValidation(
      requiredField: json["required"],
      minLength: json["min_length"],
      maxLength: json["max_length"],
      type: json["type"],
    );
  }
}

class FieldAction {
  final String type;
  final String apiUrl;
  final String method;
  final String? nextUrl;

  FieldAction({
    required this.type,
    required this.apiUrl,
    required this.method,
    this.nextUrl,
  });

  factory FieldAction.fromJson(Map<String, dynamic> json) {
    return FieldAction(
      type: json["type"] ?? "",
      apiUrl: json["api_url"] ?? "",
      method: json["method"] ?? "",
      nextUrl: json["next_url"],
    );
  }
}
