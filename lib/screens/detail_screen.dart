import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/post.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({ Key? key }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    
    DocumentSnapshot post = ModalRoute.of(context)!.settings.arguments as DocumentSnapshot;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Waste'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            displayDate(context, post['date']),
            displayImage(context, post['imageURL']),
            displayQuantity(context, post['quantity']),
            displayLocation(context, post['latitude'], post['longitude'])
          ],
        ),
      ),
    );
  }

Widget displayDate(BuildContext context, int sinceEpoch) {
  var calendarDate = DateFormat('EEEE, MMMM d, y')
    .format(DateTime.fromMillisecondsSinceEpoch(sinceEpoch))
    .toString();

  var timeDate = DateFormat('h:mm a')
    .format(DateTime.fromMillisecondsSinceEpoch(sinceEpoch))
    .toString();

  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Text(
          calendarDate,
          style: Theme.of(context).textTheme.headlineSmall
        ),
        Text(
          timeDate,
          style: Theme.of(context).textTheme.headlineSmall
        ),
      ],
    )
  );
}

Widget displayImage(BuildContext context, String imageURL) {
  return Flexible(
    child: FractionallySizedBox(
      heightFactor: 0.7,
      child: Image.network(imageURL),
    )
  );
}

Widget displayQuantity(BuildContext context, int quantity) {
  // Currently, date is a string
  // If date is something else later, convert to a pretty string here
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      'Wasted Items: $quantity',
      style: Theme.of(context).textTheme.titleMedium
    ),
  );
}

Widget displayLocation(BuildContext context, num latitude, num longitude) {
  // Currently, date is a string
  // If date is something else later, convert to a pretty string here
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      '($latitude, $longitude)',
      style: Theme.of(context).textTheme.titleMedium
    ),
  );
}
}
