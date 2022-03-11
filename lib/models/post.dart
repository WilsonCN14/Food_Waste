class Post {
  final DateTime date;
  final String imageURL;
  final int quantity;
  final double? latitude;
  final double? longitude;

  const Post({
    required this.date,
    required this.imageURL,
    required this.quantity,
    required this.latitude,
    required this.longitude,
  });
  
  // factory Post.fromJSON(Map<String, dynamic> json) {
  //   return Post(
  //     date: json['date'],
  //     imageURL: json['imageURL'],
  //     quantity: int.parse(json['quantity']),
  //     latitude: double.parse(json['latitute']),
  //     longitude: double.parse(json['longitude']),
  //   );
  // }
}