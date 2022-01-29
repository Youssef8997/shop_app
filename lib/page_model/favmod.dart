class favmod{
  String? massge;
  bool? status;
  favmod(Map<String,dynamic>json){
    massge=json["message"];
    status=json["status"];
  }

}