/*
* Used to organize data from database
*/
class Post {
  final DateTime date;
  final String imageURL;
  final int quantity;
  final double latitude;
  final double longitude;

  const Post({
    required this.date,
    required this.imageURL,
    required this.quantity,
    required this.latitude,
    required this.longitude,
  });
  
  factory Post.fromMap(Map<String, dynamic> document) {
    return Post(
      // date stored as int in Firestore so need to convert to DateTime
      date: DateTime.fromMillisecondsSinceEpoch(document['date']), 
      imageURL: document['imageURL'],
      quantity: document['quantity'],
      latitude: document['latitude'],
      longitude: document['longitude'],
    );
  }
}