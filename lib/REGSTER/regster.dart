import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp2/LOGIN/cuibt/cuibt.dart';
import 'package:shopapp2/LOGIN/cuibt/states.dart';
import 'package:shopapp2/comp/comp.dart';
import 'package:shopapp2/shoplayout/cuibthome/cuibt.dart';
import 'package:shopapp2/shoplayout/cuibthome/states.dart';
import 'package:shopapp2/sherd/sherdpre.dart';
import 'package:shopapp2/shoplayout/shoplayout.dart';


class regster extends StatelessWidget {
var namecontrolar=TextEditingController();
var emailcontrolar=TextEditingController();
var passwordcontrolar=TextEditingController();
var phonecontrolar=TextEditingController();
var keyregs=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cuibt,homestates>(
      listener: (context,state){
        if (state is regshopappstatesucsses) {
          if (state.model.status == true) {
            sherdprefrenc.setdate(key: "token", value: state.model.date!.token)
                .then((value) {
              token = state.model.date!.token;
              print(token);
              NEV(page: shoplayout(), context: context);
            });
          } else {
            showtoast(msg: " ${state.model.message}", color: Colors.red);
            ;
          }
        }
      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body:Padding(
            padding: const EdgeInsets.all(40.0),
            child:   SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child:   Form(
                  key:keyregs,
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(radius: 50.0,
                              backgroundImage:
                              NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg")),
                          CircleAvatar(child: Icon(Icons.add_a_photo_rounded),radius: 18.0,backgroundColor: Colors.grey[300],foregroundColor: Colors.black,),

                        ],
                      ),
                      SizedBox(height: 50.0,),
                      textform(label: "first name", icon: Icon(Icons.badge), controlar: namecontrolar),
                      SizedBox(height: 20.0,),
                      textform(label: "email", icon: Icon(Icons.email_outlined), controlar:emailcontrolar,type: TextInputType.emailAddress),
                      SizedBox(height: 20.0,),
                      textform(label: "password", icon: Icon(Icons.lock), controlar:passwordcontrolar,suficon: Icon(Icons.visibility)),
                      SizedBox(height: 20.0,),
                      textform(label: "phone number", icon: Icon(Icons.phone), controlar: phonecontrolar,type:TextInputType.numberWithOptions()),
                      SizedBox(height: 20.0,),
                    MaterialButton(onPressed: (){
                      cuibt.get(context).userregs(
                          email:emailcontrolar.text, password: passwordcontrolar.text,name:namecontrolar.text,phone:phonecontrolar.text,context: context);},
                      child: Text("SAVE"),)

                    ],

                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
