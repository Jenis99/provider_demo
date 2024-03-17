import 'package:get/get.dart';
import 'package:provider_demo/module/auth/screen/login_screen.dart';
import 'package:provider_demo/module/auth/screen/otp_screen.dart';
import 'package:provider_demo/module/home/screen/home_screen.dart';
import 'package:provider_demo/module/movie/screen/movie_screen.dart';
import 'package:provider_demo/module/post_search_api/screen/item_screen.dart';
import 'package:provider_demo/module/search_screen/screen/search_screen.dart';
import 'package:provider_demo/module/user_detail/screen/user_detail_screen.dart';

mixin Routes{
  static const defaultTransition = Transition.rightToLeft;

  static const String logInScreen = '/loginScreen';
  static const String otpScreen = '/otpScreen';
  static const String countyCode = '/countyCodeScreen';
  static const String homeScreen = '/homeScreen';
  static const String searchScreen = '/searchScreen';
  static const String movieScreen = '/movieScreen';
  static const String itemScreen = '/itemScreen';
  static const String userDetailScreen = '/userDetailScreen';


  static List<GetPage<dynamic>> pages = [
    GetPage(name: logInScreen, page: () =>  LogInScreen()),
    GetPage(name: otpScreen, page: () =>  OtpScreen()),
    GetPage(name: homeScreen, page: () =>  HomeScreen()),
    GetPage(name: searchScreen, page: () =>  SearchScreen()),
    GetPage(name: movieScreen, page: () =>  MovieScreen()),
    GetPage(name: itemScreen, page: () =>  ItemScreen()),
    GetPage(name: userDetailScreen, page: () => UserDetailScreen()),
  ];

}