import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/splash/splash_screen.dart';
import 'package:shop_app/provider/country_provider.dart';
import 'package:shop_app/routs.dart';
import 'package:shop_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) =>  ChangeNotifierProvider(
       create: (context) => CountryProvider(),

   child:   MaterialApp(
      title: 'World Countries',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: routes,
    ),
   );
}
