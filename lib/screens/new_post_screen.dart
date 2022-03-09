import 'package:flutter/material.dart';
import 'list_screen.dart';
import '../widgets/new_post_screen_widgets.dart';
import 'package:location/location.dart';

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
          onPressed: () {
            // Find current date
            // Find current latitute and longitude
            // Should I have a model to hold the information like in the journal project?
            pushListScreen(context);
          },
          tooltip: 'Upload Post',
          child: const Icon(Icons.upload),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    }
  }
}

void pushListScreen(BuildContext context) {
  Navigator.pushAndRemoveUntil(context, 
  MaterialPageRoute(builder: (context) => const ListScreen()), 
  (Route<dynamic> route) => false);
}
