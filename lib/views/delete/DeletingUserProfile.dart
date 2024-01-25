import 'package:flutter/material.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/properProfile.dart';

import 'package:api_demo/models/entrepreneurproperProfile.dart';
import 'package:api_demo/views/thirdafterMakingEntreprenuer.dart';

class DeletingUserProfile extends StatefulWidget {
  // const EightDeletingProperProfile({Key? key}) : super(key: key);
  final String enteredId;
  DeletingUserProfile({required this.enteredId});

  @override
  State<DeletingUserProfile> createState() => _DeletingUserProfileState();
}

class _DeletingUserProfileState extends State<DeletingUserProfile> {
  ProperProfile? singleUser; // Change the type to SingleUser?
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    // Fetch data from API
    deleteProfile();
  }

  getData() async {
    // Assuming that your RemoteService().getEachUsers method returns a Future<SingleUser?>
    singleUser =
        await RemoteService().GetEachProperProfile(int.parse(widget.enteredId));

    if (singleUser != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  // deleteData() async {
  //   // Assuming that your RemoteService().getEachUsers method returns a Future<SingleUser?>
  //   singleUser = await RemoteService().deleteProperProfile(41);

  //   if (singleUser != null) {
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   }
  // }

  Future<void> deleteProfile() async {
    try {
      await RemoteService().deleteUserProfile(int.parse(widget.enteredId));
      // Optionally, you can perform additional actions after deletion
      // For example, navigate to a different screen or update the UI
      print('User Profile deleted successfully ');
    } catch (error) {
      // Handle errors if needed
      print('Error while deleting profile: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
