import 'package:flutter/material.dart';
import 'screens/new_post_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Waste',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: const NewPostScreen(),
    );
  }
}
