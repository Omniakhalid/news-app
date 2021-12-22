import 'package:flutter/material.dart';
import 'package:news/controllers/news_provider.dart';
import 'package:news/models/article.dart';
import 'package:news/models/source.dart';
import 'package:news/views/widgets/nav_drawer.dart';
import 'package:news/views/widgets/news_item.dart';
import 'package:news/views/widgets/sources_bar.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  static const String RouteName = "NewsScreen";
  late String categoryName;
  bool load = true;
  @override
  Widget build(BuildContext context) {
    categoryName = ModalRoute.of(context)!.settings.arguments.toString();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage('assets/images/pattern.png'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color(0xFF39A552),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24)
          ),
          title: Text(categoryName,style: TextStyle(color: Colors.white,fontSize: 22),),
        ),
        drawer: NavDrawer(),
        //futureBuilder to get sources
        body: FutureBuilder<List<Source>?>(
          future: Provider.of<NewsProvider>(context,listen: false).getSources(categoryName.toLowerCase()),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator.adaptive());
            }
            else if(snapshot.data == null){
              return Center(child: Text("Error Has Occurred, Please Try Again."));
            }else{
            return Column(
              children: [
                SourcesBar(snapshot.data!),
                Expanded(
                  //futureBuilder to get news
                child: FutureBuilder<List<Article>?>(
                  future: Provider.of<NewsProvider>(context).getNews(categoryName.toLowerCase()),
                  builder: (context, snapshot) {
                    if(ConnectionState.waiting == snapshot.connectionState)
                      return Center(child: CircularProgressIndicator.adaptive());
                    else if(snapshot.data == null){
                      return Center(child: Text("Error Has Occurred, Please Try Again."));}
                    else{
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return NewsItem(snapshot.data![index]);
                        },
                        itemExtent: MediaQuery.of(context).size.height*.35,
                      );
                    }

                  }
                ),
                )
              ],
            );
            }
          }
        ),
      ),
    );
  }
}
