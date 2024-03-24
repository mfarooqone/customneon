class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? address;
  final String? type;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.address,
    this.type,
  });

  // Convert UserModel to a Map
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'address': address,
    };
  }

  // Factory constructor to create a UserModel instance from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      address: json['address'],
      type: json['type'],
    );
  }
}
