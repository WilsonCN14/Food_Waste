/* 
* DTO stands for Data Transfer Object
* Used to organize data for new post
*/
class PostDTO {
  late DateTime date;
  late String imageURL;
  late int quantity;
  late double? latitude;
  late double? longitude;

  Map<String, dynamic> toMap() {
    return {
      'date': date.millisecondsSinceEpoch, // date is int in Firestore
      'imageURL': imageURL,
      'quantity': quantity,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
  
}