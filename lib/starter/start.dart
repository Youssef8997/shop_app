import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp2/LOGIN/LOGIN.dart';
import 'package:shopapp2/comp/comp.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shopapp2/sherd/sherdpre.dart';


class pagemodel
{
  final String url;
  final String title;
  final String body;
  pagemodel( {
    required this.url,
    required this.title,
    required this.body,

}
      );

}

class start  extends StatefulWidget {
  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  var controlar=PageController();

  List<pagemodel> module=[
pagemodel(
    url: "https://img.freepik.com/free-vector/happy-family-shopping-mother-father-son-daughter-are-jumping-holding-packages-with-purchases_165429-704.jpg?size=626&ext=jpg",
    title: "first title",
    body: "first title"
),
    pagemodel(
        url: "https://img.freepik.com/free-vector/happy-family-shopping-mother-father-son-daughter-are-jumping-holding-packages-with-purchases_165429-704.jpg?size=626&ext=jpg",
        title: "scound title",
        body: "scound title"
    ),
    pagemodel(
        url: "https://www.crushpixel.com/big-static18/preview4/happy-family-with-shopping-father-2821800.jpg",
        title: "third title",
        body: "third title"
    )
  ];
bool?isfalse=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shopapp",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w900),),
        centerTitle:true,
        actions: [
       TextButton(child: Text("SKIP",style: TextStyle(color: Colors.black),),onPressed: (){
         sherdprefrenc.setdate(key: "onbord", value: true).then((value) {Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> login()),
                 (Route route)=>false);});

         },)
        ],

      ),
      body:Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(

          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder:(context,index)=>buildptage(module[index]),
                onPageChanged: (index){
                  if(index==module.length-1) {
                    setState(() {
                      isfalse = true;
                    });
                  } else
                    {
                      setState(() {
                        isfalse=false;
                      });
                    }
                },
                itemCount: module.length,
                controller: controlar,
                physics:BouncingScrollPhysics(),

              ),
            ),
            Row(
              children: [
               SmoothPageIndicator(
                 controller: controlar,
                 effect: ExpandingDotsEffect(
                   activeDotColor: Colors.deepOrange,
                   dotColor: Colors.grey,
                   dotHeight: 15.0,
                   expansionFactor: 2.0,
                   dotWidth: 15.0,
                   radius: 20.0


                 ),
                 count: module.length,
               ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                  if(isfalse==true){
                    sherdprefrenc.setdate(key: "onbord", value: true).then((value) {Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> login()),
                            (Route route)=>false);});


                  }
                  else {
                      controlar.nextPage(
                          duration: Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child:Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
