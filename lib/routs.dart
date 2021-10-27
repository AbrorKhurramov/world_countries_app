
 import 'package:flutter/widgets.dart';
import 'package:shop_app/example_screen.dart';
import 'package:shop_app/home/home_screen.dart';
import 'package:shop_app/splash/splash_screen.dart';
import 'example_screen.dart';
 final Map<String,WidgetBuilder> routes =  {
   SplashScreen.routeName: (context) => SplashScreen(),
HomeScreen.routeName: (context) => HomeScreen(),
  ExampleScreen.routeName: (context) => ExampleScreen(),
 };