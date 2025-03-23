class UserModel {
  String name, email, phone,id;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.id,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'], 
        email: map['email'], 
        phone: map['phone'],
        id: map['id'],
      );
  }
}
