import 'package:customneon/models/cart_model.dart';

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
