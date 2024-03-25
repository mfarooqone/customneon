// class UserModel {
//   final String? id;
//   final String? name;
//   final String? email;
//   final String? photoUrl;
//   final String? address;
//   final String? type;

//   UserModel({
//     this.id,
//     this.name,
//     this.email,
//     this.photoUrl,
//     this.address,
//     this.type,
//   });

//   // Convert UserModel to a Map
//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'email': email,
//       'photoUrl': photoUrl,
//       'address': address,
//     };
//   }

//   // Factory constructor to create a UserModel instance from a JSON map
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['_id'],
//       name: json['name'],
//       email: json['email'],
//       photoUrl: json['photoUrl'],
//       address: json['address'],
//       type: json['type'],
//     );
//   }
// }

class UserModel {
  String? token;
  String? sId;
  String? name;
  String? email;
  String? password;
  String? address;
  String? type;
  List<Cart>? cart;
  int? iV;
  String? photoUrl;

  UserModel({
    this.token,
    this.sId,
    this.name,
    this.email,
    this.password,
    this.address,
    this.type,
    this.cart,
    this.iV,
    this.photoUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    type = json['type'];
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart!.add(Cart.fromJson(v));
      });
    }
    iV = json['__v'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['address'] = address;
    data['type'] = type;
    if (cart != null) {
      data['cart'] = cart!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    data['photoUrl'] = photoUrl;
    return data;
  }
}

class Cart {
  String? id;
  String? neon;
  String? price;
  String? fontstyle;
  String? align;
  String? color;
  String? size;
  String? height;
  String? width;
  String? backboardcolor;
  String? backboardstyle;
  String? location;
  String? adaptertype;
  String? remote;
  String? description;

  Cart(
      {this.id,
      this.neon,
      this.price,
      this.fontstyle,
      this.align,
      this.color,
      this.size,
      this.height,
      this.width,
      this.backboardcolor,
      this.backboardstyle,
      this.location,
      this.adaptertype,
      this.remote,
      this.description});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    neon = json['neon'];
    price = json['price'];
    fontstyle = json['fontstyle'];
    align = json['align'];
    color = json['color'];
    size = json['size'];
    height = json['height'];
    width = json['width'];
    backboardcolor = json['backboardcolor'];
    backboardstyle = json['backboardstyle'];
    location = json['location'];
    adaptertype = json['adaptertype'];
    remote = json['remote'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['neon'] = neon;
    data['price'] = price;
    data['fontstyle'] = fontstyle;
    data['align'] = align;
    data['color'] = color;
    data['size'] = size;
    data['height'] = height;
    data['width'] = width;
    data['backboardcolor'] = backboardcolor;
    data['backboardstyle'] = backboardstyle;
    data['location'] = location;
    data['adaptertype'] = adaptertype;
    data['remote'] = remote;
    data['description'] = description;
    return data;
  }
}
