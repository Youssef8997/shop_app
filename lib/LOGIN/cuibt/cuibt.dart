

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp2/LOGIN/cuibt/states.dart';
import 'package:shopapp2/comp/comp.dart';
import 'package:shopapp2/dio_helper/dio.dart';
import 'package:shopapp2/page_model/pagemodel.dart';
import 'package:shopapp2/shoplayout/shoplayout.dart';

class cuibtshop extends Cubit<loginshopappstate>{
  cuibtshop() : super(loginshopappstateinis());
  static cuibtshop get(context)=>BlocProvider.of(context);
  bool isobes=true;
  pagemodela? model;
  void userloging({required email,required password}){
    emit(loginshopappstateloding());
    dio_helper.postdata(

        url:"login",
        date:
    {
      "email":"$email",
      "password":"$password"
    }
    ).then((value) {
     model=pagemodela.userdate(value.data);
      emit(loginshopappstatesucsses(model!));
    }).catchError((Error) {
      print("the error is $Error");
      emit(loginshopappstateerror(Error.toString()));
    }
    );
  }
void obserd(){
   isobes= !isobes;
   emit(changeobserved());

    }
  }


