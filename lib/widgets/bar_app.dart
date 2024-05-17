import 'package:flutter/material.dart';

class BarApp extends  StatelessWidget {
  const BarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('List Pokemon'),
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            
          }
        )
      ],
    );
  }
}