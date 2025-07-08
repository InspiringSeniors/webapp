import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Replace with your auth check logic
    final isAuthenticated = AuthService.to.isLoggedIn;

    if (!isAuthenticated && route == '/adminDashboard') {
      return RouteSettings(name: '/adminLogin');
    }

    return null; // allow navigation
  }
}


class AuthService extends GetxService {
  static AuthService get to => Get.find();


  var isLoggedIn = false; // Set to true when user logs in

   login() async{

     print("called logiin");

    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();

    sharedPreferences.setBool("isAdminLoggedIn", true);
     print("called logiin");

     isLoggedIn = true;
  }

   logout() async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();

    sharedPreferences.setBool("isAdminLoggedIn", false);
    isLoggedIn = false;
  }
}


class UserAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Replace with your auth check logic
    final isAuthenticated = UserAuthService.to.isLoggedIn;

    if (!isAuthenticated && route == '/userDashboard') {
      return RouteSettings(name: '/homepage');
    }


    if (!isAuthenticated && route == '/userDashboard/editProfile') {
      return RouteSettings(name: '/homepage');
    }
    if (!isAuthenticated && route == '/userDashboard/resetPassword') {
      return RouteSettings(name: '/homepage');
    }
    return null; // allow navigation
  }
}


class UserAuthService extends GetxService {
  static UserAuthService get to => Get.find();


  var isLoggedIn = false; // Set to true when user logs in

  login() async{

    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();

    sharedPreferences.setBool("isUserLoggedIn", true);
    isLoggedIn = true;
  }

  logout() async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();

    sharedPreferences.setBool("isUserLoggedIn", false);
    isLoggedIn = false;
  }
}


