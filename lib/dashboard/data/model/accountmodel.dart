class SignUpRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  SignUpRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
      };
}

class User {
  String firstName;
  String lastName;
  String userName;
  String email;

  User({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      lastName: json['last_name'],
      userName: json['user_name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'user_name': userName,
      'email': email,
    };
  }
}
