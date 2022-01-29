class catmodle{
  bool? status;
  gdata?data;
  catmodle.json(Map<String,dynamic>json){
    status=json["status"];
    data=gdata.json(json["data"]);
  }
}
class gdata{
  int? current_page;
  List<dataGet>?datab=[];
  gdata.json(Map<String,dynamic>json){
    current_page=json["current_page"];
    json["data"].forEach((element){
      datab!.add(dataGet(element));
    });

  }
}
class dataGet{
  int? id;
  String? name;
  String? image;
  dataGet(Map<String,dynamic>json){
    id=json["id"];
    name=json["name"];
    image=json["image"];
  }

}