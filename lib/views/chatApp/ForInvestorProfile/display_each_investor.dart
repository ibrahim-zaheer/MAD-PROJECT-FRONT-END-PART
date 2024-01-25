// import 'package:flutter/material.dart';
// import 'package:api_demo/models/post.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/services/remote_service.dart';

// class SixthDisplayingEachUser extends StatefulWidget {
//   final String enteredId;

//   // Constructor
//   SixthDisplayingEachUser({required this.enteredId});

//   @override
//   State<SixthDisplayingEachUser> createState() =>
//       _SixthDisplayingEachUserState();
// }

// class _SixthDisplayingEachUserState extends State<SixthDisplayingEachUser> {
//   List<User>? posts;
//   var isLoaded = false;

//   @override
//   void initState() {
//     super.initState();

//     // Fetch data from API
//     getData();
//   }

//   getData() async {
//     // Assuming that your RemoteService().getEachUsers method returns a Future<List<User>?>
//     // posts = await RemoteService().getEachUsers(int.parse(widget.enteredId));
//     posts = await RemoteService().getEachUsers(int.parse(widget.enteredId));

//     if (posts != null) {
//       setState(() {
//         isLoaded = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TextEditingController texter = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Posts'),
//       ),
//       body: Visibility(
//         visible: isLoaded,
//         child: ListView.builder(
//           itemCount: posts?.length ?? 0,
//           itemBuilder: (context, index) {
//             return Container(
//               padding: const EdgeInsets.all(16),
//               child: Row(
//                 children: [
//                   Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.grey[300],
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           posts![index].username.toString(),
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           posts![index].phoneNumber.toString(),
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           posts![index].email.toString(),
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           posts![index].role.toString(),
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//         replacement: const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:api_demo/models/post.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/singleUser.dart'; // Import SingleUser model
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/views/SeventhDisplayProperFile.dart';
import 'package:api_demo/models/entrepreneurusering.dart';
import 'package:api_demo/models/investorusering.dart';
import 'package:api_demo/models/singleUser.dart';

import 'package:api_demo/models/post.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/usering.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/views/SixthDisplayingEachUser.dart';
import 'package:api_demo/views/chatApp/chat_screen_for_private_chatting.dart';

class SixthDisplayingEachUser extends StatefulWidget {
  final String enteredId;
  final String recipientId;

  // Constructor
  SixthDisplayingEachUser({required this.enteredId, required this.recipientId});

  @override
  State<SixthDisplayingEachUser> createState() =>
      _SixthDisplayingEachUserState();
}

class _SixthDisplayingEachUserState extends State<SixthDisplayingEachUser> {
  SingleUser? singleUser; // Change the type to SingleUser?
  var isLoaded = false;
  List<User>? _post;
  SingleUser? _singleUser;
  List<Entrepreneurusering>? posts;

  @override
  void initState() {
    super.initState();

    // Fetch data from API
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
    int enteredId1 = int.parse(widget.enteredId);
    int recipientId1 = int.parse(widget.recipientId);
    if (enteredId1 > recipientId1) {
      enteredId1 = recipientId1;
      recipientId1 = enteredId1;
    } else {
      enteredId1 = enteredId1;
      recipientId1 = recipientId1;
    }
    String collectionName = (enteredId1.toString() + recipientId1.toString());
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
              Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username: ${singleUser!.username.toString()}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Role: ${singleUser!.role.toString()}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'PhoneNumber: ${singleUser!.phoneNumber.toString()}',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Email: ${singleUser!.email.toString()}',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        loggedInUserId:
                            widget.recipientId, //this represents the sender
                        collectionName: collectionName,
                        otherUserId:
                            widget.enteredId, // this represents the reciever
                      ),
                    ),
                  );
                },
                child: Text('Message Me'),
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























// import 'package:flutter/material.dart';
// import 'package:api_demo/models/post.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/models/singleUser.dart'; // Import SingleUser model
// import 'package:api_demo/services/remote_service.dart';
// import 'package:api_demo/views/SeventhDisplayProperFile.dart';
// import 'package:api_demo/models/entrepreneurusering.dart';
// import 'package:api_demo/models/investorusering.dart';
// import 'package:api_demo/models/singleUser.dart';

// import 'package:api_demo/models/post.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/models/usering.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:flutter/material.dart';
// import 'package:api_demo/views/SixthDisplayingEachUser.dart';
// import 'package:api_demo/views/chatApp/chat_screen_for_private_chatting.dart';

// class SixthDisplayingEachUser extends StatefulWidget {
//   final String enteredId;
//   final String recipientId;

//   // Constructor
//   SixthDisplayingEachUser({required this.enteredId, required this.recipientId});

//   @override
//   State<SixthDisplayingEachUser> createState() =>
//       _SixthDisplayingEachUserState();
// }

// class _SixthDisplayingEachUserState extends State<SixthDisplayingEachUser> {
//   SingleUser? singleUser; // Change the type to SingleUser?
//   var isLoaded = false;
//   List<User>? _post;
//   SingleUser? _singleUser;
//   List<Entrepreneurusering>? posts;

//   @override
//   void initState() {
//     super.initState();

//     // Fetch data from API
//     getData();
//   }

//   getData() async {
//     // Assuming that your RemoteService().getEachUsers method returns a Future<SingleUser?>
//     singleUser =
//         await RemoteService().getEachUsers(int.parse(widget.enteredId));

//     if (singleUser != null) {
//       setState(() {
//         isLoaded = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     int enteredId1 = int.parse(widget.enteredId);
//     int recipientId1 = int.parse(widget.recipientId);
//     if (enteredId1 > recipientId1) {
//       enteredId1 = recipientId1;
//       recipientId1 = enteredId1;
//     } else {
//       enteredId1 = enteredId1;
//       recipientId1 = recipientId1;
//     }
//     String collectionName = (enteredId1.toString() + recipientId1.toString());
//     // TextEditingController texter = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Posts'),
//       ),
//       body: Visibility(
//         visible: isLoaded,
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   const SizedBox(width: 50),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Username: ${singleUser!.username.toString()}',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15.0,
//                         ),
//                         Text(
//                           'Role: ${singleUser!.role.toString()}',
//                           style: TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10.0,
//                         ),
//                         Text(
//                           'PhoneNumber: ${singleUser!.phoneNumber.toString()}',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(
//                           height: 10.0,
//                         ),
//                         Text(
//                           'Email: ${singleUser!.email.toString()}',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(
//                           height: 10.0,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ChatScreen(
//                         loggedInUserId:
//                             widget.recipientId, //this represents the sender
//                         collectionName: collectionName,
//                         otherUserId:
//                             widget.enteredId, // this represents the reciever
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text('Message Me'),
//               ),
//             ],
//           ),
//         ),
//         replacement: const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
