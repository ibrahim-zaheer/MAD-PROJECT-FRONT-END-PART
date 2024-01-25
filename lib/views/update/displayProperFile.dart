import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/models/post.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/properProfile.dart';
import 'package:api_demo/models/singleUser.dart'; // Import SingleUser model
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/views/SeventhDisplayProperFile.dart';
import 'package:api_demo/views/delete/DeletingUserProfile.dart';

class SeventhDisplayProperFile extends StatefulWidget {
  final String enteredId;

  SeventhDisplayProperFile({required this.enteredId});

  @override
  State<SeventhDisplayProperFile> createState() =>
      _SeventhDisplayProperFileState();
}

class _SeventhDisplayProperFileState extends State<SeventhDisplayProperFile> {
  ProperProfile? singleUser; // Change the type to SingleUser?
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    // Fetch data from API
    getData();
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

  @override
  Widget build(BuildContext context) {
    // TextEditingController texter = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                singleUser!.username.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                singleUser!.phoneNumber.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                singleUser!.email.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                singleUser!.role.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                singleUser!.dateOfBirth.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                singleUser!.city.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                singleUser!.country.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                singleUser!.postalCode.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                singleUser!.latestJob.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                singleUser!.salaryIncomeAllowance.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                singleUser!.isMarried.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                singleUser!.cnicNumber.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
