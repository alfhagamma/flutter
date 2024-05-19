import 'package:flutter/material.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({
    super.key,
  });

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      surfaceTintColor: Colors.purple,
      backgroundColor: const Color(0xECE6E7EC),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                const Text('Home'),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                ),
                const Text('About'),
              ]
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.pushNamed(context, '/pokemon');
                  },
                ),
                const Text('Pokemon'),
              ]
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.textsms),
                  onPressed: () {
                    Navigator.pushNamed(context, '/pokemonPage');
                  },
                ),
                const Text('Pokemon Page'),
              ]
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.account_balance_outlined),
                  onPressed: () {
                    Navigator.pushNamed(context, '/pokemonListPage');
                  },
                ),
                const Text('Pokemon List Page'),
              ]
            ),
          ],
        ),
      ),
    );
  }
}