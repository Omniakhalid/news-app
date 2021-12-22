import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article.dart';
import 'package:news/views/screens/article_details.dart';
import 'package:timeago/timeago.dart' as timeago;
class NewsItem extends StatelessWidget {
  Article article;
  NewsItem(this.article);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(ArticleDetails.RouteName,arguments: article);
        },
      child: Container(
        margin: EdgeInsets.all(14).subtract(EdgeInsets.only(top: 14)),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(article.urlToImage),fit: BoxFit.fill)
                ),
              ),
            ),
            SizedBox(height: 3,),
            Expanded(
              //flex: 2,
              child: Column(
                children: [
                  Align(child: Text(article.source.name+"•",style: TextStyle(color: Color(0xFF798288)),),alignment: Alignment.centerLeft,),
                  Align(child: Text(article.title,maxLines: 2,),alignment: Alignment.centerLeft,),
                  Align(child: FittedBox(child: Text(timeago.format(article.publishedAt),style: TextStyle(color: Color(0xFF798288)),)),alignment: Alignment.centerRight,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
