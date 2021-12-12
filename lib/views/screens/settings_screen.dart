import 'package:flutter/material.dart';
import 'package:news/controllers/settings_provider.dart';
import 'package:news/views/widgets/nav_drawer.dart';
import 'package:news/views/widgets/settings_option.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  static const String RouteName = "SettingsScreen";
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
    title: Text(AppLocalizations.of(context)!.settings_nav,style: TextStyle(color: Colors.white,fontSize: 22),),
    ),
    drawer: NavDrawer(),
    body: Container(
    padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
              alignment: Provider.of<SettingsProvider>(context).locale=='en'?Alignment.centerLeft:Alignment.centerRight,
              margin: EdgeInsets.all(10),
              child: Text(AppLocalizations.of(context)!.language,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,color: Color(0xFF303030)
                  ))),
          SettingsOption(
            opt1: 'English',
            opt2: 'العربيه',
            value1: 'en',
            value2: 'ar',
            selectedValue: Provider.of<SettingsProvider>(context).locale,
            onChanged: (locale) {
              Provider.of<SettingsProvider>(context,listen: false).changeLocale(locale);
            },
          ),
        ],
      ),
    ),
    ));
  }
}