import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp2/LOGIN/cuibt/cuibt.dart';
import 'package:shopapp2/LOGIN/cuibt/states.dart';
import 'package:shopapp2/REGSTER/regster.dart';
import 'package:shopapp2/comp/comp.dart';
import 'package:shopapp2/shoplayout/shoplayout.dart';
import 'package:shopapp2/sherd/sherdpre.dart';

class login extends StatelessWidget {
  var kayform = GlobalKey<FormState>();
  var email = TextEditingController();
  var pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cuibtshop, loginshopappstate>(
      listener: (context, state) {
        if (state is loginshopappstatesucsses) {
          if (state.model.status == true) {
            sherdprefrenc
                .setdate(key: "token", value: state.model.date!.token)
                .then((value) {
               token = state.model.date!.token;
              print(token);
              NEV(page: shoplayout(), context: context);
            });
          } else {
            showtoast(msg: " ${state.model.message}", color: Colors.red);

          }
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: kayform,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg"),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text("Email"),
                            labelStyle: TextStyle(fontSize: 22.0),
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            // counterText: "Email Must have Example:@gamil.com",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email must not be empty";
                            }
                            return null;
                          },
                          controller: email,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text("password"),
                            labelStyle: TextStyle(fontSize: 22.0),
                            prefixIcon: Icon(Icons.lock_open),
                            suffixIcon: IconButton(
                                icon: cuibtshop.get(context).isobes
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  cuibtshop.get(context).obserd();
                                  print(cuibtshop.get(context).isobes);
                                }),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            // counterText: "Email Must have Example:@gamil.com",
                          ),
                          obscureText: cuibtshop.get(context).isobes,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "pass must not be empty";
                            }
                            return null;
                          },
                          controller: pass,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! loginshopappstateloding,
                          builder: (BuildContext context) => Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(50.0)),
                              width: 150,
                              child: MaterialButton(
                                onPressed: () {
                                  if (kayform.currentState!.validate())
                                    cuibtshop.get(context).userloging(
                                        email: email.text, password: pass.text.toString());

                                },
                                child: Text("LOGIN"),
                                color: Colors.amber,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                              )),
                          fallback: (BuildContext context) => Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              50.0)),
                                  width: 150,
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: Text("please wait ......."),
                                    color: Colors.amber,
                                    shape: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                  )),
                            ],
                          ),
                        ),
                        /* SizedBox(
                            height: 10.0,
                          ),*/
                        MaterialButton(
                            onPressed: () {},
                            child: Text("dont have email?",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.grey[400]))),
                        Container(
                          height: 40.0,
                          width: 150.0,
                          child: MaterialButton(
                            onPressed: () {
                              NEV(
                                  page: regster(),
                                  context: context,
                                  bool: true);
                            },
                            child: Text("REGSTER"),
                            color: Colors.amber,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
