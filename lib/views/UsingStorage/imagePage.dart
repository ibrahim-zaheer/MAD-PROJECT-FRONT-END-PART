import 'package:flutter/material.dart';
import '../UsingStorage/firebaseStorageService.dart';

class ImagePage extends StatelessWidget {
  final String imagePath;

  ImagePage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Page'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: FirebaseStorageService().downloadImage(imagePath),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error loading image: ${snapshot.error}');
            } else {
              final imageUrl = snapshot.data;

              return imageUrl != null
                  ? Image.network(imageUrl)
                  : Text('Image not found');
            }
          },
        ),
      ),
    );
  }
}
