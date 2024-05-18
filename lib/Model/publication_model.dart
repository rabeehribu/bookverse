class PublicationModel {
  String libraryId;
  String email;
  String libraryName;
  String location;

  PublicationModel({
    required this.libraryId,
    required this.email,
    required this.libraryName,
    required this.location,
  });
  factory PublicationModel.fromMap(Map<String, dynamic> map) {
    return PublicationModel(
      libraryId: map['userId'],
      email: map['email'],
      libraryName: map['age'],
      location: map['gender'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'userId': libraryId,
      'email': email,
      'age': libraryName,
      'gender': location,
    };
  }
}

