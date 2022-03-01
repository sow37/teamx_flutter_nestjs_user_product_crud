class User {
  final String userId;
  final String firstname;
  final String lastname;
  final String? address;

  User({required this.userId, required this.firstname, required this.lastname, this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstname": firstname,
    "lastname": lastname,
    "address": address,
  };

}