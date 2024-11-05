class RegisterModel {
  final dynamic phone;
  final dynamic password;
  final dynamic displayName;
  final dynamic experienceYears;
  final dynamic address;
  final dynamic level;

  RegisterModel(
      {required this.phone,
      required this.password,
      required this.displayName,
      required this.experienceYears,
      required this.address,
      required this.level});

  factory RegisterModel.fromJson(json) {
    return RegisterModel(
      phone: json['phone'],
      password: json['password'],
      displayName: json['displayName'],
      experienceYears: json['experienceYears'],
      address: json['address'],
      level: json['level'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'displayName': displayName,
      'password': password,
      "experienceYears": experienceYears,
      "address": address,
      "level": level
    };
  }
}
