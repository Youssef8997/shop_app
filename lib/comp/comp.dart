import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp2/starter/start.dart';
import 'package:shopapp2/sherd/sherdpre.dart';


Widget buildptage(pagemodel module){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.network(module.url),
      SizedBox(height: 25.0,),
      Text(module.title,
        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 25.0,),

      Text(module.body,
        style: TextStyle(fontSize: 25,),
      ),
    ],
  );
}
Future NEV({ page, context, bool=false}){
  return Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> page),(Route route)=>bool);
}
Widget textform({
  required String label,
   type=TextInputType.text,
  required Icon icon,
  required  controlar,
    suficon,
  boolen=false,

}){
return  TextFormField(
    decoration: InputDecoration(label:Text("$label"),
      labelStyle: TextStyle(fontSize: 22.0),
      prefixIcon: icon,
      suffixIcon:suficon,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),),
      // counterText: "Email Must have Example:@gamil.com",


    ),
    obscureText:boolen ,
    keyboardType: type ,
    validator: (value){
      if(value!.isEmpty)
      {
        return "$label must not be empty";
      }
      return null;
    },
    controller:controlar ,


  );
}
Widget button({
  required bool condition,
  required VoidCallback func,
  required VoidCallback notfunc,
  required String text,

}){
  return ConditionalBuilder(
    condition:condition,
    builder: (BuildContext context)=>Container(
        decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(50.0)),
        width: 150,
        child: MaterialButton(onPressed: (){
          func;
        },
          child: Text("$text"),color: Colors.blueAccent,shape:OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),)),
    fallback: (BuildContext context)=> Row(children: [Container(
        decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(50.0)),
        width: 150,
        child: MaterialButton(onPressed: (){notfunc;},
          child: Text("please wait ......."),color: Colors.blueAccent,shape:OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),)),
    ],),

  );
}
void showtoast({required String msg,required Color color}){
  Fluttertoast.showToast(
      msg:msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor:color,
      textColor: Colors.red,
      fontSize: 25.0
  );
}
String? token;
