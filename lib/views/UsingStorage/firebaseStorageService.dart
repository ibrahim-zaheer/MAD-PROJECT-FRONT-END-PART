import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: 'gs://food-4cd22.appspot.com');

  Future<String> downloadImage(String imagePath) async {
    try {
      final Reference ref = _storage.ref().child(imagePath);
      final String url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Error downloading image: $e');
      return ''; // Return an empty string or handle the error accordingly
    }
  }
}
