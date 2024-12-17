import 'dart:convert';

class UsersResponse {
  List<User?>? users;

  UsersResponse({this.users});

  UsersResponse.userFromJson(String str) {
    users =
        List<User>.from(json.decode(str).map<User>((x) => User.fromJson(x)));
  }
}

class User {
  String? lastName;
  String? firstName;
  String? email;
  String? username;
  String? role;
  String? accessType;
  String? companyIdentifier;

  User(
      {this.lastName,
      this.firstName,
      this.email,
      this.username,
      this.role,
      this.accessType,
      this.companyIdentifier});

  User.fromJson(Map<String, dynamic> json) {
    lastName = json['last_name'];
    firstName = json['first_name'];
    email = json['email'];
    username = json['username'];
    role = json['role'];
    accessType = json['access_type'];
    companyIdentifier = json['companyIdentifier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_name'] = lastName;
    data['first_name'] = firstName;
    data['email'] = email;
    data['username'] = username;
    data['role'] = role;
    data['access_type'] = accessType;
    data['companyIdentifier'] = companyIdentifier;
    return data;
  }
}
