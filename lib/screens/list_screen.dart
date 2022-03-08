import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({ Key? key }) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  static const List<MockPost> postList = [
    MockPost(date: 'Tuesday, March 3', numFood: 2),
    MockPost(date: 'Friday, March 4', numFood: 5),
    MockPost(date: 'Tuesday, March 8', numFood: 10),
  ];

  Widget displayPost(BuildContext context, MockPost post) {
    return ListTile(
      title: Text(post.date),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          shape: BoxShape.circle, 
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(post.numFood.toString()),
      ),
      onTap: () => {}, // () => toDetailScreen(context, index)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Waste'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: postList.length,
        itemBuilder: (BuildContext context, int index) =>
          displayPost(context, postList[index]),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Add New Post',
        child: const Icon(Icons.add_a_photo),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class MockPost {
  const MockPost({required this.date, required this.numFood});

  final String date;
  final int numFood;
}