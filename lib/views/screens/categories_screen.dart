import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/views/widgets/category_item.dart';
import 'package:news/views/widgets/nav_drawer.dart';

class CategoriesScreen extends StatelessWidget {
  static const String RouteName = "CategoriesScreen";
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          title: Text(AppLocalizations.of(context)!.news_title,style: TextStyle(color: Colors.white,fontSize: 22),),
        ),
        drawer: NavDrawer(),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.pick_cat, style: TextStyle(color:Color(0xFF4F5A69),fontSize: 22, fontWeight: FontWeight.bold),),
              Text(AppLocalizations.of(context)!.interest, style: TextStyle(color:Color(0xFF4F5A69),fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Expanded(
                child: GridView.count(
                    crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 20,
                  children: [
                    CategoryItem.left(AppLocalizations.of(context)!.sports, 'assets/images/ball.png', Color(0xFFC91C22)),
                    CategoryItem.right(AppLocalizations.of(context)!.politics, 'assets/images/Politics.png', Color(0xFF003E90)),

                    CategoryItem.left(AppLocalizations.of(context)!.health, 'assets/images/health.png', Color(0xFFED1E79)),
                    CategoryItem.right(AppLocalizations.of(context)!.business, 'assets/images/bussines.png', Color(0xFFCF7E48)),

                    CategoryItem.left(AppLocalizations.of(context)!.environment, 'assets/images/environment.png', Color(0xFF4882CF)),
                    CategoryItem.right(AppLocalizations.of(context)!.sciences, 'assets/images/science.png', Color(0xFFF2D352)),
                  ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
