
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp2/page_model/get%20fav.dart';
import 'package:shopapp2/shoplayout/cuibthome/cuibt.dart';
import 'package:shopapp2/shoplayout/cuibthome/states.dart';

class fav extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<cuibt,homestates>(
      listener: (context,state){},
      builder: (context,state){
        var yy=cuibt.get(context);

        return ConditionalBuilder(
          condition:state is! homegetfavlodstate,
          builder:(context)=>ListView.separated(
              itemBuilder: (context,index)=>favpro(yy.Getfav!.data!.datr[index],context),
              separatorBuilder:(context,index)=>Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ) ,
              itemCount:yy.Getfav!.data!.datr.length),
          fallback:(context)=>Center(child: CircularProgressIndicator()) ,
        );

      },
    );

  }
  /*Widget favs(getfav? model){
    return Container(
      child:ListView.separated(
        itemBuilder: (context,index)=>favpro(model!.data!.data),
        separatorBuilder:(context,index)=>SizedBox(height: 10,),
        itemCount: model!.data!.datr) ,
    );

  }*/

  Widget favpro(pridectid model,context,){
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
width: double.infinity,
            height: 200,
            child: Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Container(
                      height: 180,
                      width: 150,
                      child: Image(image: NetworkImage("${model.product!.image}"),
                        width: 150,
                        height: 180.0,
                        fit: BoxFit.fill,
                        errorBuilder: (context, exception,  stackTrace) {
                          return Image(image: NetworkImage("https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"),fit: BoxFit.cover,);
                        },
                      )
                    ),
                    if(model.product!.discount!=0)
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
                        height:45,
                        width: 175,
                        child: Text(
                          "${model.product!.name}",
                          maxLines: 3,
                          overflow:TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,
                          ),

                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 180,
                        child: Text("Get it as soon as tomorrow,dec 21",
                          style: TextStyle(fontSize: 15.0,color: Colors.grey[700]),),
                      ),
                      Text(
                        "${model.product!.price}",
                        style:TextStyle(fontSize: 20.0,color: Colors.grey[800]),
                      ),
                        Container(
                          height: 40,
                          width: 200,
                          child: Row(
                            children: [
                              if(model.product!.discount!=0)
                                Text(
                                "${model.product!.old_price}",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 18.0
                                ),
                              ),
                              Spacer(),
                              IconButton(onPressed: (){
                                cuibt.get(context).changefav(model.product!.id,);
                              },
                                  icon:Icon(Icons.favorite,color: Colors.red,size: 27,)),
                            ],
                          ),
                        ),
                      Container(
                        padding: EdgeInsetsDirectional.only(start: 50.0),
                        height: 35.0,
                       // color: Colors.amber,
                        child: MaterialButton(
                          color: Colors.amber,
                          onPressed: (){},
                          child: Text("ADD TO CART",style: TextStyle(fontWeight: FontWeight.w800),),
                          splashColor:Colors.teal,


                        ),
                      )




                    ],
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}

