import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final picker = ImagePicker();
  File? _pickedImage;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      final appDocumentsDirectory = await getApplicationDocumentsDirectory();
      final savedImagePath = "${appDocumentsDirectory.path}/picked_image.jpg";

      // Check and request storage permission
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
        status = await Permission.storage.status;
        if (!status.isGranted) {
          // Handle permission denied
          return;
        }
      }

      await imageFile.copy(savedImagePath);

      setState(() {
        _pickedImage = File(savedImagePath);
      });

      // Upload image to Firebase Storage
      final user = FirebaseAuth.instance.currentUser;
      final userId = user?.uid;

      if (userId != null) {
        final collectionReference =
            FirebaseFirestore.instance.collection('user_images');
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images/$userId/picked_image.jpg');

        // Check if the collection exists
        final docSnapshot = await collectionReference.doc(userId).get();

        if (!docSnapshot.exists) {
          // If the document doesn't exist, create the collection
          await collectionReference.doc(userId).set({});
        }

        // Upload image to Firebase Storage
        await storageRef.putFile(_pickedImage!);

        // Get download URL
        final String downloadURL = await storageRef.getDownloadURL();

        // Store download URL in Firestore document
        await collectionReference.doc(userId).set(
          {
            'image_url': downloadURL,
          },
          SetOptions(merge: true),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _pickedImage != null
            ? Image.file(
                _pickedImage!,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              )
            : Container(),
        ElevatedButton(
          onPressed: _pickImage,
          child: Text("Pick Image"),
        ),
      ],
    );
  }
}
