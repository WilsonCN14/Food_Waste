import 'package:flutter_test/flutter_test.dart';
import 'package:food_waste/models/post.dart';

void main() {
  test('Post created from Map should have appropriate property values for imageURL, quantity, latitude, and longitude', () {
    const imageURL = 'FAKE';
    const quantity = 0;
    const latitude = 0.0;
    const longitude = 0.0;

    final post = Post.fromMap({
      'date': 0,
      'imageURL': imageURL,
      'quantity': quantity,
      'latitude': latitude,
      'longitude': longitude,
    });

    expect(post.imageURL, imageURL);
    expect(post.quantity, quantity);
    expect(post.latitude, latitude);
    expect(post.longitude, longitude);
  });

  test('Post created from Map should convert date from int to DateTime', () {
    var date = DateTime.fromMillisecondsSinceEpoch(0);
    const imageURL = 'FAKE';
    const quantity = 0;
    const latitude = 0.0;
    const longitude = 0.0;

    final post = Post.fromMap({
      'date': 0,
      'imageURL': imageURL,
      'quantity': quantity,
      'latitude': latitude,
      'longitude': longitude,
      
    });

    expect(post.date, date);
  });
}