class User {
  final Map? data;
  final int? userId;
  final String? email;
  final String? token;
  final String? error;

  User({
    this.userId,
    this.data,
    this.email,
    this.token,
    this.error,
  });

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        data: responseData['data'],
        email: responseData['message'],
        token: responseData['access_token'],
        error: responseData['error']);
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
