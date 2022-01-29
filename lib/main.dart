import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopapp2/LOGIN/LOGIN.dart';
import 'package:shopapp2/LOGIN/cuibt/cuibt.dart';
import 'package:shopapp2/comp/comp.dart';
import 'package:shopapp2/dio_helper/dio.dart';
import 'package:shopapp2/shoplayout/cuibthome/cuibt.dart';
import 'package:shopapp2/shoplayout/shoplayout.dart';
import 'package:shopapp2/starter/start.dart';
import 'package:shopapp2/sherd/sherdpre.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await sherdprefrenc.init();
  bool? onbording=sherdprefrenc.getdate(key:"onbord");
   token=sherdprefrenc.getdate(key:"token");
  print(token);
  dio_helper.init();

  Widget? widget;
  if(onbording==true){
    if(token!=null) {
      widget = shoplayout();
    }else {
      widget=login();
    }
  }else{widget=start();}
  runApp(MyApp(onbording,widget));
}

class MyApp extends StatelessWidget {
  final onbording;
  final widget;

  MyApp(this.onbording,this.widget);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context)=>cuibt()..getuserdata()..getfavdata()..gethomedata()..getcatdata()),
    BlocProvider(
    create: (BuildContext context)=>cuibtshop()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.amber,

          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarContrastEnforced: true,
                systemStatusBarContrastEnforced: false,
                statusBarColor: Colors.white,
                systemNavigationBarColor:Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,

            ),
            color: Colors.white,
        elevation:0,
        centerTitle: true,
        ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black54,
selectedIconTheme:
IconThemeData(
    color:Colors.amber,size: 30.0,opacity:1 ),
              unselectedIconTheme: IconThemeData(color:Colors.grey[500],size:25.0,opacity:.655),
              elevation: 0,

        )
        ),

        home:start()
      ),
    );
  }
}

