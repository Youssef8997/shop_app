class pagemodela{
  bool? status;
  String? message;
  userdate? date;
pagemodela.userdate(Map<String,dynamic>json)
{
  status=json["status"];
  message=json["message"];
  date=json["data"]!=null?userdate(json["data"]) :null;
}

}
class userdate{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? point;
  int? credit;
  String? token;
  userdate(Map<String,dynamic>json)
  {
    id=json['id'];
name=json['name'];
email=json['email'];
image=json['image'];
phone=json['phone'];
point=json['point'];
credit=json['credit'];
token=json['token'];
  }
}