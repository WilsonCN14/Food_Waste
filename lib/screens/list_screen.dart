import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/post.dart';
import '../widgets/navigation_widgets.dart';

/*
* Screen that shows list of all posts
* Only shows date and number of wasted items for each post
*/
class ListScreen extends StatefulWidget {
  const ListScreen({ Key? key }) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  final Stream<QuerySnapshot> _postsStream = FirebaseFirestore.instance
    .collection('posts')
    .orderBy('date', descending: true)
    .snapshots();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Waste'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _postsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.separated(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> document = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                Post post = Post.fromMap(document);
                return displayPost(context, post);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
      floatingActionButton: Semantics(
        child: FloatingActionButton(
          onPressed: () {pushNewPostScreen(context);},
          child: const Icon(Icons.add_a_photo),
        ),
        button: true,
        label: 'Add New Post button',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget displayPost(BuildContext context, Post post) {
    return ListTile(
      title: Text(DateFormat('EEEE, MMMM d, h:mm a').format(post.date).toString()),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          shape: BoxShape.circle, 
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(post.quantity.toString()),
      ),
      onTap: () {pushDetailScreen(context, post);}
    );
  }
}
