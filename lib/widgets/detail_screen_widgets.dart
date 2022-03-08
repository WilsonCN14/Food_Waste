import 'package:flutter/material.dart';

Widget detailDate(BuildContext context, String date) {
  // Currently, date is a string
  // If date is something else later, convert to a pretty string here
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      date,
      style: Theme.of(context).textTheme.headlineSmall
    ),
  );
}

Widget detailImage(BuildContext context) {
  return const Flexible(
    child: FractionallySizedBox(
      heightFactor: 0.5,
      child: Placeholder(),
    )
  );
}

Widget detailItemNum(BuildContext context, int itemNum) {
  // Currently, date is a string
  // If date is something else later, convert to a pretty string here
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      'Items: $itemNum',
      style: Theme.of(context).textTheme.titleMedium
    ),
  );
}

Widget detailLocation(BuildContext context, num latitude, num longitude) {
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