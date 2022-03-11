import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import '../widgets/navigation_widgets.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({ Key? key }) : super(key: key);

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final _formKey = GlobalKey<FormState>();

  LocationData? locationData;
  var locationService = Location();

  File? image;
  final picker = ImagePicker();
  late String imageURL;

  late String date;
  late int quantity;
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return image == null ? getImageWidget(context) : fillOutFormWidget(context);
  }

  // Screen appearance when user needs to pick out an image
  Widget getImageWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Waste - Photo'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Take Photo'),
          onPressed: () {takePhoto();},
        )
      ),
    );
  }

  // Screen appearance after user picked out an image
  Widget fillOutFormWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Waste - New Post'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              displayImage(context),
              getQuantity(context),
              isSubmitting == true ? const CircularProgressIndicator() : uploadPost(context),
            ],
          ),
        ),
      ),
    );
  }

  void takePhoto() async {
    final newFile = await picker.pickImage(source: ImageSource.camera);
    image = File(newFile!.path);
    imageURL = newFile.path;
    setState(() {});
  }

  Widget displayImage(BuildContext context) {
    return Flexible(
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Image.file(image ?? File('')),
      ),
    );
  }

  Widget getQuantity(BuildContext context) {
    return TextFormField(
      autofocus: true,
      decoration: const InputDecoration(
        labelText: 'Number of Items'
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a number';
        } else if (int.tryParse(value) == null){
          return 'Please enter a number';
        } else {
          quantity = int.tryParse(value) ?? 0;
          return null;
        }
      }
    );
  }

  Widget uploadPost(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState?.save();
          setState(() {
            isSubmitting = true;
          });
          getCurrentDate();
          await getCurrentLocation();
          FirebaseFirestore.instance.collection('posts').add({
            'date': date,
            'imageURL': imageURL,
            'quantity': quantity,
            'latitude': locationData!.latitude,
            'longitude': locationData!.longitude,
          });
          setState(() {
            isSubmitting = false;
          });
          pushListScreen(context);
        }
      }, 
      child: const Icon(Icons.upload),
    );
  }

  void getCurrentDate() {
    var fullDate = DateTime.now();

    date = DateFormat('yMMMEd').format(fullDate).toString();
  }

  Future<Object> getCurrentLocation() async {
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
        }
      }

      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
        }
      }

      locationData = await locationService.getLocation();
    } on PlatformException {
      locationData = null;
    }
    return locationData = await locationService.getLocation();
  }
}
