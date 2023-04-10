import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/bloc/cubits/news_cubit.dart';
import 'package:news_app/app/routes/app_pages.dart';
import 'package:news_app/app/ui/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsCubit>(create: (context) => NewsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: AppTheme.themeData(context),
        routes: AppPages.pages(context),
        initialRoute: AppRoutes.homePage,
      ),
    );
  }
}
