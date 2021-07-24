import 'package:fegoz/screens/AllCategotiesScreen.dart';
import 'package:fegoz/screens/CartScreen.dart';
import 'package:fegoz/screens/CheckOutScreen.dart';
import 'package:fegoz/screens/FinishOrder.dart';
import 'package:fegoz/screens/MainScreen.dart';
import 'package:fegoz/screens/MakePaymentScreen.dart';
import 'package:fegoz/screens/ProfileScreen.dart';
import 'package:fegoz/screens/SearchScreen.dart';
import 'package:fegoz/screens/SignUp.dart';
import 'package:fegoz/screens/initScreen.dart';
import 'package:fegoz/screens/login.dart';
import 'package:fegoz/screens/rest.dart';
import 'package:fegoz/screens/splashscreen.dart';
import 'package:fegoz/widgets/MyDrawer.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  InitScreen.routeName: (context) => InitScreen(),
  MakePaymentScreen.routeName: (context) => MakePaymentScreen(),
  FinishOrder.routeName: (context) => FinishOrder(),
  CheckOutScreen.routeName: (context) => CheckOutScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  CardDrawer.routeName: (context) => CardDrawer(screen: MainScreen()),
  LogInScreen.routeName: (context) => LogInScreen(),
  ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  AllCategories.routeName: (context) => AllCategories()
};
