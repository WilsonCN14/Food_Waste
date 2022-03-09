import 'package:flutter/material.dart';
import '../widgets/detail_screen_widgets.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({ Key? key }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Waste'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            detailDate(context, 'Tuesday, March 8, 2022'),
            detailImage(context),
            detailItemNum(context, 10),
            detailLocation(context, 37.232, -122.031)
          ],
        ),
      ),
    );
  }
}
