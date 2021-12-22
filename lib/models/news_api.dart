import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news/models/article.dart';
import 'package:news/models/source.dart';

class NewsApi{
  static String apiKey ='8273c896eda44b3aa16642d6141019e0';
  static String baseApi = 'https://newsapi.org/v2/';
  static Dio dio = Dio();
  static Future<List<dynamic>> getSources(String cat)async{
    //1- get or post?
    //2- baseUrl
    //3- apiKey+params
    String url = baseApi+'top-headlines/sources?apiKey=$apiKey&category=$cat';
    try{
   Response response = await dio.get(url);
   //print(response.data["sources"]);
   return response.data["sources"] ;}
    on DioError catch (e) {
      throw e.error;
    }
  }
  static Future<List<dynamic>> getNews(String cat) async{
    String url = baseApi+'top-headlines?apiKey=$apiKey&category=$cat';
    try{
      Response response = await dio.get(url);
      //print(response.data["articles"]);
      return response.data["articles"] ;
    } on DioError catch (e) {
      throw e.error;
    }
  }

}