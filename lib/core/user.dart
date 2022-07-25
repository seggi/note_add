class User {
  final Map? data;
  final int? userId;
  final String? email;
  final String? token;

  User({
    this.userId,
    this.data,
    this.email,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      data: responseData['data'],
      email: responseData['message'],
      token: responseData['access_fresh_token'],
    );
  }
}

class TokenObject {
  late Map<String, dynamic>? tokenData;
  late String expiredDate;
  TokenObject({required this.tokenData, required this.expiredDate});
}

class NewBorrower {
  final List userData;

  NewBorrower({required this.userData});
  factory NewBorrower.fromJson(Map<String, dynamic> json) {
    return NewBorrower(userData: json["data"]);
  }
}
