import 'package:flutter/material.dart';
import 'package:api_demo/models/properProfile.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/views/update/updatingProperProfile.dart';

class SeventhDisplayProperFile extends StatefulWidget {
  final String enteredId;

  SeventhDisplayProperFile({required this.enteredId});

  @override
  State<SeventhDisplayProperFile> createState() =>
      _SeventhDisplayProperFileState();
}

class _SeventhDisplayProperFileState extends State<SeventhDisplayProperFile> {
  ProperProfile? singleUser;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    // Fetch data from API
    getData();
  }

  getData() async {
    // Assuming that your RemoteService().GetEachProperProfile method returns a Future<ProperProfile?>
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserProfileField(
                    label: 'Username', value: singleUser?.username),
                UserProfileField(
                    label: 'Phone Number', value: singleUser?.phoneNumber),
                UserProfileField(label: 'Email', value: singleUser?.email),
                UserProfileField(label: 'Role', value: singleUser?.role),
                UserProfileField(
                    label: 'Date of Birth',
                    value: singleUser?.dateOfBirth.toString()),
                UserProfileField(label: 'City', value: singleUser?.city),
                UserProfileField(label: 'Country', value: singleUser?.country),
                UserProfileField(
                    label: 'Postal Code',
                    value: singleUser?.postalCode.toString()),
                UserProfileField(
                    label: 'Latest Job', value: singleUser?.latestJob),
                UserProfileField(
                    label: 'Salary Income Allowance',
                    value: singleUser?.salaryIncomeAllowance),
                UserProfileField(
                    label: 'Marital Status', value: singleUser?.isMarried),
                UserProfileField(
                    label: 'CNIC Number', value: singleUser?.cnicNumber),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserProfileField extends StatelessWidget {
  final String? label;
  final String? value;

  UserProfileField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value ?? '',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
