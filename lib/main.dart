import 'package:flutter/material.dart';
import 'package:news_api/screen/first/first_screen.dart';
import 'package:news_api/screen/home/provider/home_provider.dart';
import 'package:news_api/screen/home/view/home_screen.dart';
import 'package:news_api/screen/new/view/new_screen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => LogoScreen(),
          'new':(context) => NewsScreen(),
          'news':(context) => DetailScreen(),
        },
      ),
    ),
  );
}