import 'package:flutter/material.dart';
import 'package:project04/model/pokemon.dart';
import 'package:project04/pages/test_page.dart';
import 'pages/about_page.dart';
import 'pages/home_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'Pokemon',
      routes: {
        '/': (BuildContext context) => const  HomePage(),
        '/about': (BuildContext context) => const  AboutPage(),
        '/pokemon': (BuildContext context) => const  Pokemon(domain: 'pokeapi.co', route: '/api/v2/pokemon',),
        '/test': (BuildContext context) => const TestPage(),
      },
      title: 'App Pokemon',
    );
  }
}