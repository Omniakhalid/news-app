import 'package:flutter/material.dart';
import 'package:news/controllers/news_provider.dart';
import 'package:news/models/news_api.dart';
import 'package:news/models/source.dart';
import 'package:provider/provider.dart';

class SourceBarItem extends StatelessWidget {
  Source source;
  SourceBarItem(this.source);
  @override
  Widget build(BuildContext context) {
    bool isSelected = source.name == Provider.of<NewsProvider>(context).selectedSrc.name;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: TextButton(
          style: ButtonStyle(
            backgroundColor: isSelected? MaterialStateProperty.all<Color>(Color(0xFF39A552)):MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),side: BorderSide(color: Color(0xFF39A552),))),
          ),
          onPressed: (){
            Provider.of<NewsProvider>(context,listen: false).changeSelectedSrc(source);
          },
          child: Text(source.name,style: TextStyle(color: isSelected?Colors.white:Color(0xFF39A552),),)),
    );
  }
}
