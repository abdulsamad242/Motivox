class OnboardingScreenTwo {
  final String status;
  final String metaVersion;
  final OnboardingStep2 meta;

  OnboardingScreenTwo({
    required this.status,
    required this.metaVersion,
    required this.meta,
  });

  factory OnboardingScreenTwo.fromJson(Map<String, dynamic> json) {
    return OnboardingScreenTwo(
      status: json["status"] ?? "",
      metaVersion: json["meta_version"] ?? "",
      meta: OnboardingStep2.fromJson(
        json["meta_json"]["onboarding_step2"],
      ),
    );
  }
}

class OnboardingStep2 {
  final String heading;
  final String tagline;
  final String nicheTitle;
  final String nicheTagline;
  final String microNicheTitle;
  final String microNicheTagline;
  final OnboardingFormStep2 form;

  OnboardingStep2({
    required this.heading,
    required this.tagline,
    required this.nicheTitle,
    required this.nicheTagline,
    required this.microNicheTitle,
    required this.microNicheTagline,
    required this.form,
  });

  factory OnboardingStep2.fromJson(Map<String, dynamic> json) {
    return OnboardingStep2(
      heading: json["heading"] ?? "",
      tagline: json["tagline"] ?? "",
      nicheTitle: json["niche_title"] ?? "",
      nicheTagline: json["niche_tagline"] ?? "",
      microNicheTitle: json["micro_niche_title"] ?? "",
      microNicheTagline: json["micro_niche_tagline"] ?? "",
      form: OnboardingFormStep2.fromJson(json["form"]),
    );
  }
}

class OnboardingFormStep2 {
  final String name;
  final List<FormFieldStep2> fields;

  OnboardingFormStep2({
    required this.name,
    required this.fields,
  });

  factory OnboardingFormStep2.fromJson(Map<String, dynamic> json) {
    return OnboardingFormStep2(
      name: json["name"] ?? "",
      fields: (json["fields"] as List)
          .map((e) => FormFieldStep2.fromJson(e))
          .toList(),
    );
  }
}

class FormFieldStep2 {
  final String type;
  final String label;
  final String name;
  final String? placeholder;
  final String? hintText;
  final List<String>? options;
  final FieldValidation? validation;
  final FieldAction? action;

  FormFieldStep2({
    required this.type,
    required this.label,
    required this.name,
    this.placeholder,
    this.hintText,
    this.options,
    this.validation,
    this.action,
  });

  factory FormFieldStep2.fromJson(Map<String, dynamic> json) {
    return FormFieldStep2(
      type: json["type"] ?? "",
      label: json["label"] ?? "",
      name: json["name"] ?? "",
      placeholder: json["placeholder"],
      hintText: json["hint_text"],
      options: json["options"] != null
          ? List<String>.from(json["options"])
          : null,
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

  FieldAction({
    required this.type,
    required this.apiUrl,
  });

  factory FieldAction.fromJson(Map<String, dynamic> json) {
    return FieldAction(
      type: json["type"] ?? "",
      apiUrl: json["api_url"] ?? "",
    );
  }
}
