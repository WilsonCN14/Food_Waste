class Post {
  late String date;
  late String imageURL;
  late int quantity;
  late double? latitude;
  late double? longitude;

  // const Post({
  //   required this.date,
  //   required this.imageURL,
  //   required this.quantity,
  //   required this.latitude,
  //   required this.longitude,
  // });

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'imageURL': imageURL,
      'quantity': quantity,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  // @override
  // String toString() {
  //   return 'Post{date: $date, imageURL: $imageURL, quantity: $quantity, latitude: $latitude, longitude: $longitude}';
  // }

}