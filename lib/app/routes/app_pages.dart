import 'package:flutter/material.dart';
import 'package:news_app/app/ui/screens/home/home_page.dart';

part './app_routes.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext)> pages(
          BuildContext context) =>
      {
        AppRoutes.homePage: (context) => const HomePage(),
      };
}
