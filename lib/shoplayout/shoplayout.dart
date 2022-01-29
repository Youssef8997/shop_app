import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp2/LOGIN/LOGIN.dart';
import 'package:shopapp2/moudel/search_screen/search.dart';
import 'package:shopapp2/sherd/sherdpre.dart';
import 'package:shopapp2/comp/comp.dart';
import 'package:shopapp2/shoplayout/cuibthome/cuibt.dart';
import 'package:shopapp2/shoplayout/cuibthome/states.dart';

class shoplayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<cuibt,homestates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit= cuibt.get(context);
          return Scaffold(
            backgroundColor: Colors.black,
             appBar: AppBar(
               toolbarHeight:
               5

             ),
              body:Container(
                padding: EdgeInsetsDirectional.only(bottom:20.0,start: 10,end:10),
decoration: BoxDecoration(

  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90),bottomRight:  Radius.circular(90 )),
  
),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: cubit.scrren[cubit.currntindex]),
             bottomNavigationBar: BottomNavigationBar(
               items:cubit.nav,
            currentIndex: cubit.currntindex,
            onTap:(index) {
              cubit.changeindex(index);
              if(index==3)
                cubit.getuserdata();
            },),
          );
        },
      );

  }
}
