import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/views/screens/categories_screen.dart';
import 'package:news/views/screens/settings_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF39A552),
            ),
            child: Center(child: Text(AppLocalizations.of(context)!.news_title+'!',style: TextStyle(fontSize: 25,color: Colors.white),),),
          ),
          ListTile(
            leading: Icon(Icons.list, color: Colors.black, size: 29,),
            title: Text(AppLocalizations.of(context)!.categories_nav,style: TextStyle(fontSize: 19),),
            onTap: () {
              if (ModalRoute.of(context)!.settings.name != CategoriesScreen.RouteName){
                Navigator.of(context).pushReplacementNamed(CategoriesScreen.RouteName);}}),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black, size: 29,),
            title: Text(AppLocalizations.of(context)!.settings_nav,style: TextStyle(fontSize: 19),),
              onTap: () {
                if (ModalRoute.of(context)!.settings.name != SettingsScreen.RouteName){
                  Navigator.of(context).pushReplacementNamed(SettingsScreen.RouteName);}}),
        ],
      ),
    );
  }
}
