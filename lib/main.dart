import 'package:animequotes/providers/anime_quote_provider.dart';
import 'package:animequotes/views/anime_quote_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AnimeQuoteProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Anime Quotes',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: AnimeQuoteScreen(),
      ),
    );
  }
}
