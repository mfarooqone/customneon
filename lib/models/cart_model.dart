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
