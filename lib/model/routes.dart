import 'package:email_password_login/login/home_screen.dart';
import 'package:email_password_login/login/login_screen.dart';
import 'package:email_password_login/login/splash_screen.dart';
import 'package:email_password_login/login/test.dart';
import 'package:email_password_login/login/welcome_screen.dart';
import '../tracking/blacktint.dart';

const String welcomeRoute = "/welcome";
const String homeRoute = "/home";
const String loginRoute = "/login";
const String splashRoute = "/splash"; 
const String testRoute = "/test"; 
const String blackTintRoute = "/blackTint"; 

final routes = {
  welcomeRoute: (context) => welcomeScreen(),
  homeRoute: (context) => HomeScreen(),
  loginRoute: (context) => LoginScreen(),
  splashRoute: (context) => splashScreen(),
  testRoute: (context) => testScreen(),
  blackTintRoute: (context) => BlackTint()
};
