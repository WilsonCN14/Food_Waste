import 'package:flutter/material.dart';
import '../screens/detail_screen.dart';
import '../screens/list_screen.dart';
import '../screens/new_post_screen.dart';

// Go to Detail Screen
void pushDetailScreen(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
      builder: (context) => const DetailScreen()));
}

// Go to New Post Screen
void pushNewPostScreen(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => const NewPostScreen()));
}

// Go to List Screen; clear navigation stack so can't go back to submission form
void pushListScreen(BuildContext context) {
  Navigator.pushAndRemoveUntil(context, 
  MaterialPageRoute(builder: (context) => const ListScreen()), 
  (Route<dynamic> route) => false);
}