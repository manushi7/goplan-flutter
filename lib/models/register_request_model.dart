class RegisterRequestModel {
  RegisterRequestModel({
    required this.fullName,
    required this.email,
    required this.dob,
    required this.phoneNumber,
    required this.employmentStatus,
    required this.password,
  });
  late final String fullName;
  late final String email;
  late final String dob;
  late final String phoneNumber;
  late final String employmentStatus;
  late final String password;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    dob = json['dob'];
    phoneNumber = json['phoneNumber'];
    employmentStatus = json['employmentStatus'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullName'] = fullName;
    _data['email'] = email;
    _data['dob'] = dob;
    _data['phoneNumber'] = phoneNumber;
    _data['employmentStatus'] = employmentStatus;
    _data['password'] = password;
    return _data;
  }
}
