import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp2/page_model/homemoudle.dart';
import 'package:shopapp2/shoplayout/cuibthome/cuibt.dart';
import 'package:shopapp2/shoplayout/cuibthome/states.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cuibt,homestates>(
      listener: (context,state){},
      builder: (context,state){
        var tc= cuibt.get(context);
        return ConditionalBuilder(
          condition: tc.homemodel!=null,
          builder:(context)=>Home(tc.homemodel,context) ,
          fallback:(context)=>Center(child: CircularProgressIndicator()) ,
          );

      },
    );


  }
  Widget Home(Homemodel? model,context){
    return SingleChildScrollView(
      child: Column(
        children: [

          Container(
            height: 200,
            width: double.infinity,
            child: CarouselSlider(
                items:model!.data!.Banners!.map((e)=>Image(
                    image:NetworkImage(
                      "${e.image}",),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 200,


                )

                ).toList() ,


              options: CarouselOptions(
                viewportFraction: .9,
                height: 200,
                initialPage:0,
                autoPlay: true,
                autoPlayAnimationDuration:Duration(seconds: 1),
                autoPlayCurve:Curves.fastLinearToSlowEaseIn,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 3),
                pauseAutoPlayOnTouch: true,
                scrollDirection: Axis.horizontal,
                scrollPhysics:BouncingScrollPhysics(),
                enableInfiniteScroll: true,

              )
              ),
          ),

          Container(
//padding:EdgeInsetsDirectional.only(start: 8,end: 8),
            child: GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 1,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: .5,
            childAspectRatio: 1/.65,
              children:List.generate(
                  model.data!.products!.length,
                      (index)=>prodect(model.data!.products![index],context,)),
            ),
          ),
          SizedBox(height: 50,)

        ],
      ),
    );
  }
  Widget prodect(productsm model,context) {
    return Container(
      color: Colors.white,

      child: Row(
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(image: NetworkImage("${model.image}"),
              width: 150,
              height: 180.0,
                fit: BoxFit.fill,

            ),
              if(model.discount !=0)
              Container(
                color: Colors.red,
                child: Text("DISSCOUNT",
                style: TextStyle(fontSize: 13),),
              )
            ],
          ),
          SizedBox(width: 5.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 51,
                  width: 175,
                  child: Text(
                      "${model.name}",
                    maxLines: 3,
  overflow:TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
                Container(
                  height: 20,
                  width: 170.0,
                  child: RatingBar.builder
                    (
                      glow: true,
                    itemSize: 30,
                    minRating:1,
                      itemCount: 5,
                      itemBuilder:(context,_)=>Icon(Icons.star,color: Colors.amber,),
                      onRatingUpdate: (Rating){}
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  width: 180,
                  child: Text("Get it as soon as tomorrow,dec 21",
                  style: TextStyle(fontSize: 15.0,color: Colors.grey[700]),),
                ),
                Text(
                    "${model.price}",
style:TextStyle(fontSize: 20.0,color: Colors.grey[800]),
                ),

                if(model.discount !=0)
                Text(
                    "${model.old_price}",
style: TextStyle(
  decoration: TextDecoration.lineThrough,
    fontSize: 18.0
),
                ),
                Container(
                  width: 170,
                  height: 50,
                  child: Row(children: [
                    IconButton(onPressed: (){
                      cuibt.get(context).changefav(model.id,);
                    },
                        icon:cuibt.get(context).Fav![model.id]?Icon(Icons.favorite,color: Colors.red,size: 30,):Icon(Icons.favorite_border_outlined,size: 30,)),
                    Spacer(),
                    IconButton(onPressed: (){}, icon:Icon(Icons.add_shopping_cart_outlined)),
                  ],),
                )

              ],
            ),
          ),


        ],
      ),
    );
  }
}
