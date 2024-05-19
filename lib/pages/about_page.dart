import 'package:flutter/material.dart';
import '../widgets/drawer_app.dart';

class AboutPage extends StatelessWidget {

  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar:  AppBar(
        title: const Text("About page"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {  },
          )
        ],
      ),
    );
  }
}