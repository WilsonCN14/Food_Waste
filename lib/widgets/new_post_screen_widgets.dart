import 'package:flutter/material.dart';

Widget newImage(BuildContext context) {
  return const Flexible(
    child: FractionallySizedBox(
      heightFactor: 0.5,
      child: Placeholder(),
    )
  );
}

Widget newNumItems(BuildContext context) {
  return const TextField(
    decoration: InputDecoration(labelText: 'Number of Items'),
    keyboardType: TextInputType.number,
  );
}