import 'dart:convert';

class OnboardingScreenFour {
  final String status;
  final String metaVersion;
  final OnboardingStep4 meta;

  OnboardingScreenFour({
    required this.status,
    required this.metaVersion,
    required this.meta,
  });

  factory OnboardingScreenFour.fromJson(Map<String, dynamic> json) {
    return OnboardingScreenFour(
      status: json["status"] ?? "",
      metaVersion: json["meta_version"] ?? "",
      meta: OnboardingStep4.fromJson(json["meta_json"]["onboarding_step4"]),
    );
  }
}

class OnboardingStep4 {
  final String heading;
  final String tagline;

  final String positioningTitle;
  final String positioningExample;

  final String brandingTitle;
  final String brandingExample;

  final OnboardingForm4 form;

  OnboardingStep4({
    required this.heading,
    required this.tagline,
    required this.positioningTitle,
    required this.positioningExample,
    required this.brandingTitle,
    required this.brandingExample,
    required this.form,
  });

  factory OnboardingStep4.fromJson(Map<String, dynamic> json) {
    return OnboardingStep4(
      heading: json["heading"] ?? "",
      tagline: json["tagline"] ?? "",
      positioningTitle: json["positioning_title"] ?? "",
      positioningExample: json["positioning_example"] ?? "",
      brandingTitle: json["branding_title"] ?? "",
      brandingExample: json["branding_example"] ?? "",
      form: OnboardingForm4.fromJson(json["form"]),
    );
  }
}

class OnboardingForm4 {
  final String name;
  final List<FormFieldItem4> fields;

  OnboardingForm4({
    required this.name,
    required this.fields,
  });

  factory OnboardingForm4.fromJson(Map<String, dynamic> json) {
    return OnboardingForm4(
      name: json["name"] ?? "",
      fields: (json["fields"] as List)
          .map((e) => FormFieldItem4.fromJson(e))
          .toList(),
    );
  }
}

class FormFieldItem4 {
  final String type;
  final String label;
  final String name;
  final String? placeholder;
  final FieldValidation4? validation;
  final FieldAction4? action;

  FormFieldItem4({
    required this.type,
    required this.label,
    required this.name,
    this.placeholder,
    this.validation,
    this.action,
  });

  factory FormFieldItem4.fromJson(Map<String, dynamic> json) {
    return FormFieldItem4(
      type: json["type"] ?? "",
      label: json["label"] ?? "",
      name: json["name"] ?? "",
      placeholder: json["placeholder"],
      validation: json["validation"] != null
          ? FieldValidation4.fromJson(json["validation"])
          : null,
      action:
          json["action"] != null ? FieldAction4.fromJson(json["action"]) : null,
    );
  }
}

class FieldValidation4 {
  final bool? requiredField;
  final int? minLength;
  final int? maxLength;

  FieldValidation4({
    this.requiredField,
    this.minLength,
    this.maxLength,
  });

  factory FieldValidation4.fromJson(Map<String, dynamic> json) {
    return FieldValidation4(
      requiredField: json["required"],
      minLength: json["min_length"],
      maxLength: json["max_length"],
    );
  }
}

class FieldAction4 {
  final String type;
  final String apiUrl;

  FieldAction4({
    required this.type,
    required this.apiUrl,
  });

  factory FieldAction4.fromJson(Map<String, dynamic> json) {
    return FieldAction4(
      type: json["type"] ?? "",
      apiUrl: json["api_url"] ?? "",
    );
  }
}
