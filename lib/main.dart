import 'package:flutter/material.dart';
import 'package:pempek_candy/provider/comment_provider.dart';
import 'package:pempek_candy/provider/favorite_provider.dart';
import 'package:pempek_candy/screens/tab_bar_home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteProvider>(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider<CommentProvider>(
          create: (context) => CommentProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const TabBarHome(),
        theme: ThemeData(primarySwatch: Colors.deepPurple),
      ),
    );
  }
}
