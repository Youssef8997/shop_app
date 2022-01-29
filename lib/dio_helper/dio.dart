
import 'package:dio/dio.dart';
import 'package:shopapp2/comp/comp.dart';
import 'package:shopapp2/sherd/sherdpre.dart';


class dio_helper{

  /* token=sherdprefrenc.getdate(key:"token");*/

  static Dio? dio;
  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl:"https://student.valuxapps.com/api/",
          receiveDataWhenStatusError: true,
          headers:
          {
            "Authorization":"$token"/*"6qmwor8PkArQ6E5C0E7ffryxzQ0VoDXyE7XY5GobGo2Q48MEseGTxAvwpfK24UdXzzv5kD"*/,
            "Content-Type": "application/json",
            "lang":"ar"
        })
    );

  }
  static Future<Response> getedata({required String url,Map<String,dynamic>? query,String? token}) async {

    return await dio!.get(
      url,
      queryParameters: query,

    );

  }
  static Future<Response> postdata({required String url,Map<String,dynamic>? query,required Map<String,dynamic>? date,String? token}) async {

    return await dio!.post(
      url,
      queryParameters: query,
      data: date,
    );

  }
}
