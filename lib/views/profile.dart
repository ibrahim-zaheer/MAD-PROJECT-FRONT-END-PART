import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileScreen extends StatefulWidget {
  final String enteredId;
  final String enteredUsername;
  final String enteredPassword;
  final String enteredEmail;
  final String enteredphoneNumber;

  ProfileScreen({
    required this.enteredId,
    required this.enteredUsername,
    required this.enteredPassword,
    required this.enteredEmail,
    required this.enteredphoneNumber,
  });
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: buildProfileBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Profile'),
      centerTitle: true,
      backgroundColor: Colors.white.withOpacity(0.8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(16.0),
        child: Container(),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget buildProfileBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  var userData = snapshot.data as Map<String, dynamic>;

                  return buildProfileContainer(userData);
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Container buildProfileContainer(Map<String, dynamic> userData) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: _imageFile != null
                ? FileImage(_imageFile!)
                : _loadProfileImage(userData),
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              _pickImage();
            },
            child: const Text('Change Profile Picture'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      var userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .get();

      if (userData.exists) {
        return userData.data() as Map<String, dynamic>;
      } else {
        return Map<String, dynamic>();
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return Map<String, dynamic>();
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String imageUrl = await _uploadImageToStorage(File(pickedFile.path));
      await _saveImageUrlInFirestore(imageUrl);

      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<String> _uploadImageToStorage(File imageFile) async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    Reference storageReference =
        FirebaseStorage.instance.ref().child('profile_images/$userId.jpg');

    UploadTask uploadTask = storageReference.putFile(imageFile);
    await uploadTask.whenComplete(() => print('Image uploaded'));

    String imageUrl = await storageReference.getDownloadURL();
    return imageUrl;
  }

  Future<void> _saveImageUrlInFirestore(String imageUrl) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({'profileImageUrl': imageUrl});
    }
  }

  ImageProvider<Object>? _loadProfileImage(Map<String, dynamic> userData) {
    String? imageUrl = userData['profileImageUrl'] as String?;
    return imageUrl != null ? NetworkImage(imageUrl) : null;
  }

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/auth');
  }
}
