import 'package:flutter/material.dart';
import 'package:news/views/screens/news_screen.dart';

class CategoryItem extends StatelessWidget {
  String categoryName,img;
  Color categoryColor;
  double subRight, subLeft;
  CategoryItem.left(this.categoryName,this.img,this.categoryColor):subLeft=0,subRight=25;
  CategoryItem.right(this.categoryName,this.img,this.categoryColor):subLeft=25,subRight=0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.of(context).pushReplacementNamed(NewsScreen.RouteName, arguments: categoryName);},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: categoryColor,
          borderRadius: BorderRadius.circular(25).subtract(
        BorderRadius.only(
          bottomLeft: Radius.circular(subLeft),
          bottomRight: Radius.circular(subRight),
        ),),),
        child: Column(
          children: [
            Expanded(flex: 4,child: Image.asset(img),),
            FittedBox(child: Text(categoryName, style: TextStyle(fontSize: 19,color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
