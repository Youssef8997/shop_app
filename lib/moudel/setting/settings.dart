import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp2/comp/comp.dart';
import 'package:shopapp2/page_model/pagemodel.dart';
import 'package:shopapp2/shoplayout/cuibthome/cuibt.dart';
import 'package:shopapp2/shoplayout/cuibthome/states.dart';
import 'package:shopapp2/shoplayout/shoplayout.dart';
import 'package:shopapp2/starter/start.dart';
import 'package:shopapp2/sherd/sherdpre.dart';

class sett extends StatelessWidget
{
var username=TextEditingController();
var phone=TextEditingController();
var email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cuibt,homestates>(
      listener: (context,state){},

      builder: (context,state){
        var mm= cuibt.get(context);
       dynamic modeal=mm.regs!.date;
        username.text=modeal!.name;
        phone.text=modeal.date!.phone!;
        email.text=modeal.date!.email!;
        return ConditionalBuilder(
          condition:true,
          builder:(context)=>profileSiting(mm.userhdata,context) ,
          fallback:(context)=>Center(child: CircularProgressIndicator()) ,
        );

      },
    );

  }
  Widget profileSiting(pagemodela? model,context){


    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height:1800,
        child: Column(
          children: [
            Center(
              heightFactor: 1.8,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadiusDirectional.circular(49.0)
                ),
                child: CircleAvatar(

                  radius: 50.0,
                  backgroundImage: NetworkImage("${model!.date!.image}",

                  ),
                  onBackgroundImageError:(exception,  stackTrace)=> NetworkImage("data:image/png;base64,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",

                  ),
                ),
              ),
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(label:Text("username"),
                    labelStyle: TextStyle(fontSize: 22.0,color: Colors.black),
                  prefixIcon: Icon(Icons.person_outline),
                  hintStyle: TextStyle(fontWeight: FontWeight.w900,fontSize:20),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),),
                  // counterText: "Email Must have Example:@gamil.com",
                ),



                validator: (value){
                  if(value!.isEmpty)
                  {
                    return "username must not be empty";
                  }
                  return null;
                },
                controller: username,


              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: TextFormField(
                decoration: InputDecoration(label:Text("Email Address"),
                  labelStyle: TextStyle(fontSize: 22.0,color: Colors.black),
                  prefixIcon: Icon(Icons.email),
                  hintStyle: TextStyle(fontWeight: FontWeight.w900,fontSize:20),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),),
                  // counterText: "Email Must have Example:@gamil.com",
                ),



                validator: (value){
                  if(value!.isEmpty)
                  {
                    return "username must not be empty";
                  }
                  return null;
                },
                controller: email,


              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: TextFormField(
                decoration: InputDecoration(label:Text("phone"),
                  labelStyle: TextStyle(fontSize: 22.0,color: Colors.black),

                  prefixIcon: Icon(Icons.phone),
                  hintStyle: TextStyle(fontWeight: FontWeight.w900,fontSize:20),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),),
                  // counterText: "Email Must have Example:@gamil.com",
                ),



                validator: (value){
                  if(value!.isEmpty)
                  {
                    return "username must not be empty";
                  }
                  return null;
                },
                controller: phone,


              ),
            ),
            SizedBox(height: 50,),
            ConditionalBuilder(
                condition: true,
                builder: (context)=>MaterialButton(
                  color: Colors.amber,
                    onPressed: (){
                      cuibt.get(context).SignOut(context);

                    print("hallo");
                    },
                  child: Text("LOG OUT"),
                ),
                fallback: (context)=>MaterialButton(
                  onPressed: (){},
                  child: Text("LOG OUT"),
                ),
            )

          ],

        ),
      ),
    );
  }

}
