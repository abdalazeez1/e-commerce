abstract class User {
  int v;
  String id;
  String createdAt;
  String email;
  String fullName;
  String password;
  String updatedAt;

  User(
      {required this.v,
        required this.id,
        required this.createdAt,
        required this.email,
        required this.fullName,
        required this.password,
        required this.updatedAt});

  Map<String, dynamic> toJson();
}