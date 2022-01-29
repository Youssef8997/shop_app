import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp2/LOGIN/LOGIN.dart';
import 'package:shopapp2/comp/comp.dart';
import 'package:shopapp2/moudel/category_screen/category.dart';
import 'package:shopapp2/moudel/fav_screen/fav.dart';
import 'package:shopapp2/moudel/home_screen/home.dart';
import 'package:shopapp2/moudel/setting/settings.dart';
import 'package:shopapp2/page_model/Catogrymudle.dart';
import 'package:shopapp2/page_model/favmod.dart';
import 'package:shopapp2/page_model/get%20fav.dart';
import 'package:shopapp2/page_model/homemoudle.dart';
import 'package:shopapp2/shoplayout/cuibthome/states.dart';
import 'package:shopapp2/dio_helper/dio.dart';
import 'package:shopapp2/sherd/sherdpre.dart';
import 'package:shopapp2/page_model/pagemodel.dart';
import 'package:shopapp2/shoplayout/shoplayout.dart';
import 'package:shopapp2/starter/start.dart';



class cuibt extends Cubit<homestates> {
  cuibt() : super(homeinitstate());
  static cuibt get(context) => BlocProvider.of(context);
  int currntindex = 0;
  List<BottomNavigationBarItem> nav = [
    BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home", ),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: "category",),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "favorite",backgroundColor: Colors.red),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings",)
  ];
  List<Widget>scrren = [
    home(),
    cat(),
    fav(),
    sett(),
  ];

  void changeindex(index) {
    currntindex = index;
    emit(homechangecurrntnevstate());
  }

  Homemodel? homemodel;
  Map<dynamic,dynamic>? Fav={};
  void gethomedata() {
    emit(homehomelodingstate());
    dio_helper.getedata(url: "home", token: token).then((value) {
      homemodel = Homemodel.userdata(value.data);
      homemodel!.data!.products!.forEach((element) {Fav!.addAll({element.id:element.in_favorites}); });

      emit(homegethomesuccstate());
    }).catchError((error) {
      print(error.toString());
      emit(homegethomeerroestate());
    });
  }

  catmodle? cate;

  void getcatdata() {
    emit(homecatlodingstate());
    dio_helper.getedata(url: "categories", token: token).then((value) {
      cate = catmodle.json(value.data);
      emit(homecatsucstate());
    }).catchError((error) {
      print(error.toString());
      emit(homecaterrstate());
    });
  }
  favmod?fave;
  void changefav(id){
    Fav![id]= ! Fav![id];
    emit(homefavsucstate());
    dio_helper.postdata(url: "favorites", date: {"product_id":id},).then((value) {
  fave=favmod(value.data);
  if(fave!.status=false)
    Fav![id]= ! Fav![id];
  else {
        getfavdata();
        emit(homegetfavlodstate());
  }
      emit(homefavsucstate());
}).catchError((onError)
{
  Fav![id]= ! Fav![id];
  print(onError.toString());
  emit(homefavrrstate());

}
);

  }
  getfav? Getfav;
  void getfavdata() {
    emit(homegetfavlodstate());
    dio_helper.getedata(url: "favorites", token: token).then((value) {
      Getfav = getfav.fromjson(value.data);
      print("get fav data :${token}");
      emit(homegetfavsuccstate());
    }).catchError((error) {
      print("the error gggggg${error.toString()}");
      emit(homegetfaverroestate());
    });
  }
  pagemodela? userhdata;
 void getuserdata() {
    emit(homegetuserlodstate());
    dio_helper.getedata(url: "profile", token: token).then((value) {
      userhdata = pagemodela.userdate(value.data);
      print("get user data :${token}");
      print(value.data);
      emit(homegetusersuccstate());
    }).catchError((error) {
      print("the error is${error.toString()}");
      emit(homegetusererroestate());
    });
  }
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("AR"),value: "AR"),
    DropdownMenuItem(child: Text("EN"),value: "EN",),
    DropdownMenuItem(child: Text("A"),value: "G",),
    DropdownMenuItem(child: Text("EAN"),value: "F",),
    DropdownMenuItem(child: Text("EADN"),value: "S",),
    DropdownMenuItem(child: Text("EFN"),value: "ESN",),
    DropdownMenuItem(child: Text("ENE"),value: "ENQW",),

  ];
  dynamic selectedval="AR";
 void changedrop( value){
   selectedval=value;
   if(value==null)
     value=="AR";
   emit(changevaluedrop());
 }
  void SignOut(context){
    sherdprefrenc.removedate(key:"token").then((value)
    {
if(value) {
        NEV(page: login(), context: context);
        emit(Signout());
      }
    }


    );
  }

  pagemodela? regs;
  void userregs({required email,required password,required name,required phone,required context}){
    emit(regshopappstateloding());
    dio_helper.postdata(
        url:"register",
        date:
        {
          "email":"$email",
          "password":"$password",
          "name":"$name",
          "phone":"$phone",

        }
    ).then((value) {
      regs=pagemodela.userdate(value.data);

      print(value.data);


      emit(regshopappstatesucsses(regs!));
    }).catchError((Error) {
      print("the error is $Error");
      emit(regshopappstateerror(Error.toString()));
    }
    );
  }

}