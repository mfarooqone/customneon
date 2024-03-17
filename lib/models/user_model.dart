class UserModel {
  final String displayName;
  final String email;
  final String photoUrl;

  UserModel({
    required this.displayName,
    required this.email,
    required this.photoUrl,
  });

  // Convert UserModel to a Map
  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  // Factory constructor to create a UserModel instance from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      displayName: json['displayName'],
      email: json['email'],
      photoUrl: json['photoUrl'],
    );
  }
}
