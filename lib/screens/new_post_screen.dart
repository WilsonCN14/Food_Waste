import 'package:flutter/material.dart';
import '../widgets/new_post_screen_widgets.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({ Key? key }) : super(key: key);

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {

  bool image = true;

  @override
  Widget build(BuildContext context) {
    if (image == false) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Food Waste'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: const Text('Choose Photo'),
                onPressed: () {},
              ),
              ElevatedButton(
                child: const Text('Take Photo'),
                onPressed: () {},
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Food Waste'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              newImage(context),
              newNumItems(context),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          tooltip: 'Upload Post',
          child: const Icon(Icons.upload),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    }
  }
}
