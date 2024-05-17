import 'package:flutter/material.dart';
import '../widgets/drawer_app.dart';

class HomePage extends StatelessWidget {
  
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {  },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) => Text('Index $index')
                
              ),
            ),
          ],
        )
      )
    );
  }
}

