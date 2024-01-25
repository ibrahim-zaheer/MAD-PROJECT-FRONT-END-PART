// import 'package:flutter/material.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/models/properProfile.dart';

// import 'package:api_demo/models/entrepreneurproperProfile.dart';
// import 'package:api_demo/views/thirdafterEntreprenuer.dart';

// class EightDeletingProperProfile extends StatefulWidget {
//   // const EightDeletingProperProfile({Key? key}) : super(key: key);
//   final String enteredId;
//   EightDeletingProperProfile({required this.enteredId});

//   @override
//   State<EightDeletingProperProfile> createState() =>
//       _EightDeletingProperProfileState();
// }

// class _EightDeletingProperProfileState
//     extends State<EightDeletingProperProfile> {
//   ProperProfile? singleUser; // Change the type to SingleUser?
//   var isLoaded = false;

//   @override
//   void initState() {
//     super.initState();

//     // Fetch data from API

//     deleteProfile();
//     Future.delayed(Duration(seconds: 2));

//     deletePersonalProfile();
//   }

//   getData() async {
//     // Assuming that your RemoteService().getEachUsers method returns a Future<SingleUser?>
//     singleUser =
//         await RemoteService().GetEachProperProfile(int.parse(widget.enteredId));

//     if (singleUser != null) {
//       setState(() {
//         isLoaded = true;
//       });
//     }
//   }

//   // deleteData() async {
//   //   // Assuming that your RemoteService().getEachUsers method returns a Future<SingleUser?>
//   //   singleUser = await RemoteService().deleteProperProfile(41);

//   //   if (singleUser != null) {
//   //     setState(() {
//   //       isLoaded = true;
//   //     });
//   //   }
//   // }

//   Future<void> deleteProfile() async {
//     try {
//       await RemoteService().deleteProperProfile(int.parse(widget.enteredId));
//       // Optionally, you can perform additional actions after deletion
//       // For example, navigate to a different screen or update the UI
//       print('Profile deleted successfully ');
//     } catch (error) {
//       // Handle errors if needed
//       print('Error while deleting profile: $error');
//     }
//   }

//   Future<void> deletePersonalProfile() async {
//     try {
//       await RemoteService().deleteUserProfile(int.parse(widget.enteredId));
//       // Optionally, you can perform additional actions after deletion
//       // For example, navigate to a different screen or update the UI
//       print('Profile deleted successfully ');
//     } catch (error) {
//       // Handle errors if needed
//       print('Error while deleting profile: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:flutter/material.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/properProfile.dart';
import 'package:api_demo/views/ninthOneLoginPageButUsedWhenProfileAlreadyCreated.dart';

class EightDeletingProperProfile extends StatefulWidget {
  final String enteredId;
  EightDeletingProperProfile({required this.enteredId});

  @override
  State<EightDeletingProperProfile> createState() =>
      _EightDeletingProperProfileState();
}

class _EightDeletingProperProfileState
    extends State<EightDeletingProperProfile> {
  ProperProfile? singleUser;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    // Fetch data from API
    getData();
  }

  getData() async {
    singleUser =
        await RemoteService().GetEachProperProfile(int.parse(widget.enteredId));

    if (singleUser != null) {
      setState(() {
        isLoaded = true;
      });

      // Show the warning dialog and proceed with deletion if confirmed
      bool userConfirmed = false;
      bool? userConfirmed2 = await _showDeleteWarningDialog();
      userConfirmed = userConfirmed2 ?? false;

      if (userConfirmed) {
        // Execute the deleteProfile and deletePersonalProfile functions sequentially
        await deleteProfile();

        // Add a delay of, for example, 2 seconds
        await Future.delayed(Duration(seconds: 2));

        await deletePersonalProfile();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Login(), // Replace 'Login()' with your actual login screen/widget
          ),
        );

        // Optionally, you can perform additional actions after deletion
        // For example, navigate to a different screen or update the UI
        print('Profiles deleted successfully');
      }
    }
  }

  Future<bool?> _showDeleteWarningDialog() async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Once you delete your profile, you cannot recover it.'),
                Text('Are you sure you want to proceed?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(context)
                    .pop(true); // Close the dialog and pass true
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteProfile() async {
    try {
      await RemoteService().deleteProperProfile(int.parse(widget.enteredId));
      print('Profile deleted successfully ');
    } catch (error) {
      print('Error while deleting profile: $error');
    }
  }

  Future<void> deletePersonalProfile() async {
    try {
      await RemoteService().deleteUserProfile(int.parse(widget.enteredId));
      print('Personal profile deleted successfully ');
    } catch (error) {
      print('Error while deleting personal profile: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
