import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopapp2/page_model/Catogrymudle.dart';
import 'package:shopapp2/page_model/homemoudle.dart';
import 'package:shopapp2/shoplayout/cuibthome/cuibt.dart';
import 'package:shopapp2/shoplayout/cuibthome/states.dart';

class cat extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cuibt,homestates>(
        listener: (context,state){},
        builder: (context,state) {
          var y=cuibt.get(context);
          return ConditionalBuilder(
              condition: y.cate!=null,
              builder: (context)=>Container(
                  color: HexColor("#EDF4F4"),
                  child: categroym(y.homemodel,y.cate)),
              fallback: (context)=>Center(child: CircularProgressIndicator(),)
          );
        }
          );
    }
    Widget categroym(Homemodel? model,catmodle?modeal){
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
              items:model!.data!.Banners!.map((e)=>Image(
                image:NetworkImage(
                  "${e.image}",),
                width: double.infinity,
                fit: BoxFit.cover,
                height: 150,

              )
              ).toList() ,


              options: CarouselOptions(
                height: 200,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: true,
                autoPlay: true,
                autoPlayAnimationDuration:Duration(seconds: 3),
                autoPlayCurve:Curves.fastLinearToSlowEaseIn,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 3),
                pauseAutoPlayOnTouch: true,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1,
              )
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.count(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1/1.3,
                crossAxisSpacing: .5,
                mainAxisSpacing: .5,
                crossAxisCount:2,
              children: List.generate(
                  modeal!.data!.datab!.length, (index) =>category(modeal.data!.datab![index])
              ),
            ),
          )
        ],
      ),
    );
    }
    }

Widget category(dataGet?modeal) {
  return Container(
    child: Column(
      children: [
        CircleAvatar(
          radius: 60.0,
          backgroundImage: NetworkImage("${modeal!.image}",),
          
        ),
        Text(
            "${modeal.name}",
          style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

