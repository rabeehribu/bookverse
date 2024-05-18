class LibraryModel {
  String libraryId;
  String email;
  String libraryName;
  String location;
  String? libraryImg;


  LibraryModel({
    required this.libraryId,
    required this.email,
    required this.libraryName,
    required this.location,
    this.libraryImg,

  });

  factory LibraryModel.fromMap(Map<String, dynamic> map) {
    return LibraryModel(
      libraryId: map['libraryId'],
      email: map['email'],
      libraryName: map['libraryName'],
      location: map['location'],
      libraryImg: map['libraryImg'],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'libraryId': libraryId,
      'email': email,
      'libraryName': libraryName,
      'location': location,
      'libraryImg': libraryImg,

    };
  }
}
