class User {
  User({
    this.id,
    this.userName,
    this.name,
    this.email,
    this.password,
  });

  int? id;
  String? userName;
  String? name;
  String? email;
  String? password;

  factory User.fromMap(Map<dynamic, dynamic> json) => User(
        id: json["id"],
        userName: json["userName"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userName": userName,
        "name": name,
        "email": email,
        "password": password,
      };
}
