class Homemodel{
  bool? status;
  userdata? data;
  Homemodel.userdata(Map<String,dynamic>json){
    status=json["status"];
    data=userdata(json["data"]);
  }
}
class userdata{
  List<banners>?Banners=[];
  List<productsm>?products=[];
  userdata(Map<String,dynamic>json){
json["banners"].forEach((elmement){Banners!.add(banners.userdata(elmement));});
json["products"].forEach((elmement){products!.add(productsm.userdata(elmement));});
  }
}
class banners{
  int? id;
  String? image;
  banners.userdata(Map<String,dynamic>json){
    id=json["id"];
    image=json["image"];
  }
}
class productsm{
  int? id;
  dynamic?price;
  dynamic?old_price;
  dynamic?discount;
  String? image;
  String? name;
  bool? in_favorites;
  bool? in_cart;

  productsm.userdata(Map<String,dynamic>json){
    id=json["id"];
    price=json["price"];
    old_price=json["old_price"];
    discount=json["discount"];
    image=json["image"];
    name=json["name"];
    in_favorites=json["in_favorites"];
    in_cart=json["in_cart"];
  }
}