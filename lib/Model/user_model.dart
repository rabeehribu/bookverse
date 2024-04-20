class UserModel {
  String userId;
  String fullName;
  String age;
  String gender;
  String phoneNumber;
  String email;

  UserModel({
    required this.userId,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.email,
  });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      fullName: map['fullName'],
      age: map['age'],
      gender: map['gender'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'fullName': fullName,
      'age': age,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'email': email
    };
  }
}
