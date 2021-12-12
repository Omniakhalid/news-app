import 'package:flutter/material.dart';
import 'package:news/views/widgets/nav_drawer.dart';

class NewsScreen extends StatelessWidget {
  static const String RouteName = "NewsScreen";
  late String categoryName;
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
      ),
    );
  }
}
