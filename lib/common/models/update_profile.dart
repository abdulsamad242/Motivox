import 'dart:convert';

class UpdateProfileResponse {
  final String status;
  final String? message;
  final UserProfile? data;

  UpdateProfileResponse({
    required this.status,
    this.message,
    this.data,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      status: json["status"] ?? "",
      message: json["message"],
      data: json["data"] != null ? UserProfile.fromJson(json["data"]) : null,
    );
  }
}

class UserProfile {
  final String? profilePic;
  final String? name;
  final String? email;
  final String? mobile;
  final String? gender;
  final String? dob;
  final String? city;
  final String? state;
  final String? country;
  final String? pincode;
  final String? address;

  UserProfile({
    this.profilePic,
    this.name,
    this.email,
    this.mobile,
    this.gender,
    this.dob,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.address,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      profilePic: json["profile_pic"],
      name: json["name"],
      email: json["email"],
      mobile: json["mobile"],
      gender: json["gender"],
      dob: json["dob"],
      city: json["city"],
      state: json["state"],
      country: json["country"],
      pincode: json["pincode"],
      address: json["address"],
    );
  }
}
