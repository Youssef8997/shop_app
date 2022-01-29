class getfav{
bool? status;
getdatafav?data;
getfav.fromjson(Map<String,dynamic>json)
{
  status=json["status"];
  data=json['data'] !=null?getdatafav.fromjson(json["data"]):null;
}
}
class getdatafav{
  int?current_page;
  List<pridectid>datr=[];
  getdatafav.fromjson(Map<String,dynamic>json)
  {
    current_page = json["current_page"];
    if(json["data"] !=null)
    json["data"].forEach((element){datr.add( pridectid.fromjson(element));});

  }
}
class pridectid{
  int?oid;
  productin? product;

  pridectid.fromjson(Map<String,dynamic>json){
    oid=json["id"];
  product=json["product"] !=null ?productin.fromjson(json["product"]):null ;



  }

}
class productin {
  int? id;
  dynamic?price;
  dynamic?old_price;
  dynamic?discount;
  String? image;
  String? name;


  productin.fromjson(Map<String, dynamic>json){
    id = json["id"];
    price = json["price"];
    old_price = json["old_price"];
    discount = json["discount"];
    image=json['image'] !=null? image=json['image']: image="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg";

    name = json["name"];
  }
}