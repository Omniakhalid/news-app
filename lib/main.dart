import 'package:flutter/material.dart';
import 'package:news/controllers/news_provider.dart';
import 'package:news/controllers/settings_provider.dart';
import 'package:news/views/screens/article_details.dart';
import 'package:news/views/screens/news_screen.dart';
import 'package:news/views/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'views/screens/categories_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>SettingsProvider()),
        ChangeNotifierProvider(create: (context)=>NewsProvider()),],
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Provider.of<SettingsProvider>(context).locale),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoriesScreen(),
      routes: {
        CategoriesScreen.RouteName:(buildContext)=>CategoriesScreen(),
        NewsScreen.RouteName:(buildContext)=>NewsScreen(),
        SettingsScreen.RouteName:(buildContext)=>SettingsScreen(),
        ArticleDetails.RouteName:(buildContext)=>ArticleDetails(),
      },
      initialRoute: CategoriesScreen.RouteName,
    );
  }
}
