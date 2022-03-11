import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation_widgets.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({ Key? key }) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {


  final Stream<QuerySnapshot> _postsStream = FirebaseFirestore.instance.collection('posts').snapshots();

  Widget displayPost(BuildContext context, DocumentSnapshot post) {
    return ListTile(
      title: Text(post['date']),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          shape: BoxShape.circle, 
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(post['quantity'].toString()),
      ),
      onTap: () {pushDetailScreen(context);}
    );
  }

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
                var post = snapshot.data!.docs[index];
                return displayPost(context, post);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            );
          } else {
            return const CircularProgressIndicator();
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {pushNewPostScreen(context);},
        tooltip: 'Add New Post',
        child: const Icon(Icons.add_a_photo),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
