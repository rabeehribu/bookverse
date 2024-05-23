class PublicationModel {
  String publicationId;
  String email;
  String phoneNum;
  String publicationName;
  String location;
  String? publicationImg;

  PublicationModel({
    required this.publicationId,
    required this.email,
    required this.phoneNum,
    required this.publicationName,
    required this.location,
    this.publicationImg,
  });

  factory PublicationModel.fromMap(Map<String, dynamic> map) {
    return PublicationModel(
      publicationId: map['publicationId'],
      email: map['email'],
      phoneNum: map['phoneNum'],
      publicationName: map['publicationName'],
      location: map['location'],
      publicationImg: map['publicationImg'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'publicationId': publicationId,
      'phoneNum': phoneNum,
      'email': email,
      'publicationName': publicationName,
      'location': location,
      'publicationImg': publicationImg,
    };
  }
}
