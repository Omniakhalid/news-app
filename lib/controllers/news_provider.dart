import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article.dart';
import 'package:news/models/news_api.dart';
import 'package:news/models/source.dart';

class NewsProvider with ChangeNotifier{
  late Source selectedSrc;
  Future<List<Source>?> getSources(String cat) async{
    List<Source> sources = [];
    try{final sourceAsJson = await NewsApi.getSources(cat);
     //from list of "sources" to list of "source"
     //.tolist() 3ashan ele rage3 itratable
    sources = sourceAsJson.map((element)=>Source.fromJson(element)).toList();
    selectedSrc = sources[0];
    notifyListeners();
    return sources;//fe data
    } catch(e){
      return null;//fe error
    }
  }
  Future<List<Article>?> getNews(String cat) async{
    try{
      List<Article> articles = [];
      final articleAsJson = await NewsApi.getNews(cat);
      //print(articleAsJson);////////////////////////////////////////////////////////////
      articles = articleAsJson.map((element)=>Article.fromJson(element)).toList();///////
      /*articles = articleAsJson.forEach((element) {
        if(element["description"]!= null && element["urlToImage"]!=null){
          articles.add(Article.fromJson(element));
        }
      });*/
      //print("okkkkkkkk");
      //get articles that its source = the needed source
      List<Article>filteredArticles = articles.where((element) => element.source.name == selectedSrc.name).toList();
      print(filteredArticles.length);
      return filteredArticles;
    } catch(e){
      print(e);
      return null;//fe error
    }
  }
  void changeSelectedSrc(Source src){
    selectedSrc = src;
    notifyListeners();
  }
}