import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/post.dart';

/*
* Screen that shows off details of an individual post
* Details include: date, image, quantity of wasted items, and location
*/
class DetailScreen extends StatefulWidget {
  const DetailScreen({ Key? key }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    
    Post post = ModalRoute.of(context)!.settings.arguments as Post;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Waste'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            displayDate(context, post.date),
            displayImage(context, post.imageURL),
            displayQuantity(context, post.quantity),
            displayLocation(context, post.latitude, post.longitude)
          ],
        ),
      ),
    );
  }

  Widget displayDate(BuildContext context, DateTime date) {
    var calendarDate = DateFormat('EEEE, MMMM d, y')
      .format(date)
      .toString();

    var timeDate = DateFormat('h:mm a')
      .format(date)
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
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Wasted Items: $quantity',
        style: Theme.of(context).textTheme.titleMedium
      ),
    );
  }

  Widget displayLocation(BuildContext context, num latitude, num longitude) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '($latitude, $longitude)',
        style: Theme.of(context).textTheme.titleMedium
      ),
    );
  }
}
