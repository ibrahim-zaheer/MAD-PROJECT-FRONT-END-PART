import 'package:api_demo/models/singleUser.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/views/SeventhDisplayProperFile.dart';
// import 'package:api_demo/views/chatApp/ForInvestorProfile/ViewAllinvestors.dart';
import 'package:api_demo/views/pallete.dart';
import 'package:api_demo/views/projects/gettingEachInvestorProject.dart';
import 'package:api_demo/views/projects/gettingEachProject.dart';
import 'package:api_demo/views/update/updatingProfile.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:api_demo/views/profile.dart';
// import 'package:api_demo/models/singleUser.dart';

class NavBar extends StatefulWidget {
  final String enteredId;
  final String enteredUsername;
  final String enteredPassword;
  final String enteredEmail;
  final String enteredphoneNumber;

  NavBar({
    required this.enteredId,
    required this.enteredUsername,
    required this.enteredPassword,
    required this.enteredEmail,
    required this.enteredphoneNumber,
  });

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  SingleUser? singleUser;
  SingleUser? _singleUser;
  late TextEditingController username;
  late TextEditingController emailer;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    username = TextEditingController(text: widget.enteredUsername);
    emailer = TextEditingController(text: widget.enteredEmail);
    getData();
  }

  getData() async {
    // Assuming that your RemoteService().getEachUsers method returns a Future<SingleUser?>
    singleUser =
        await RemoteService().getEachUsers(int.parse(widget.enteredId));

    if (singleUser != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Pallete.backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Builder(
            builder: (context) {
              String name = username.text;
              String mail = emailer.text;

              return UserAccountsDrawerHeader(
                accountName: Text("$name"),
                accountEmail: Text("$mail"),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      "https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png",
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/navbarbg.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: const Text(
              "View Profile",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () async {
              int id = int.parse(singleUser!.id.toString());
              SingleUser? singleUsers = await RemoteService().getEachUsers(id);
              setState(() {
                _singleUser = singleUsers;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeventhDisplayProperFile(
                    // Pass necessary parameters to the next screen if needed
                    enteredId: id.toString(),
                    // :
                    //     singleUser, // Pass the singleUser to the next screen
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            title: const Text(
              "Update Profile",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () async {
              int id = int.parse(widget.enteredId);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => updatingProfile(
                    enteredId: id.toString(),
                    enteredUsername: singleUser!.username.toString(),
                    enteredEmail: singleUser!.email.toString(),
                    enteredphoneNumber: singleUser!.phoneNumber.toString(),
                    enteredPassword: widget.enteredPassword.toString(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.currency_pound_outlined,
              color: Colors.white,
            ),
            title: const Text(
              "Entrepreneur Projects",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () async {
              int id = int.parse(widget.enteredId);
              String userID = id.toString();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GettingEachProject(userId: userID)),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.business_center,
              color: Colors.white,
            ),
            title: const Text(
              "Investor Projects",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              int id = int.parse(widget.enteredId);
              String userID = id.toString();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        GettingEachInvestorProject(userId: userID)),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.business_center,
              color: Colors.white,
            ),
            title: const Text(
              "Change Profile Picture",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              int id = int.parse(widget.enteredId);
              String userID = id.toString();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                          enteredUsername: widget.enteredUsername,
                          enteredEmail: widget.enteredEmail,
                          enteredId: widget.enteredId,
                          enteredPassword: widget.enteredPassword,
                          enteredphoneNumber: widget.enteredphoneNumber,
                        )),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.logout_outlined,
          //     color: Colors.white,
          //   ),
          //   title: const Text(
          //     "Logout",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () {
          //     int id = int.parse(widget.enteredId);
          //     String userID = id.toString();
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) =>
          //               GettingEachInvestorProject(userId: userID)),
          //     );
          //   },
          // ),
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Perform any necessary logout actions (e.g., clear user data)

              // Exit the app using the recommended method:
              SystemNavigator.pop();

              // Or, if necessary for specific reasons, use:
              // exit(0);
            },
          ),
        ],
      ),
    );
  }
}
