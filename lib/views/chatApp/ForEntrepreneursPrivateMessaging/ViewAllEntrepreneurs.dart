import 'package:api_demo/models/entrepreneurusering.dart';
import 'package:api_demo/models/investorusering.dart';
import 'package:api_demo/models/singleUser.dart';

import 'package:api_demo/models/post.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/usering.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/views/pallete.dart';
import 'package:flutter/material.dart';
// import 'package:api_demo/views/SixthDisplayingEachUser.dart';

import 'package:api_demo/views/chatApp/ForEntrepreneursPrivateMessaging/Display_each_Entrepreneur_user.dart';

class Fifthdisplayingallentrepreneurs extends StatefulWidget {
  final String recipientId;
  Fifthdisplayingallentrepreneurs({required this.recipientId});

  @override
  State<Fifthdisplayingallentrepreneurs> createState() =>
      _FifthdisplayingallentrepreneursState();
}

class _FifthdisplayingallentrepreneursState
    extends State<Fifthdisplayingallentrepreneurs> {
  List<Entrepreneurusering>? posts;
  var isLoaded = false;
  List<User>? _post;
  SingleUser? _singleUser;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getEntrepreneurProjects();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Entrepreneur Projects',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Pallete.backgroundColor,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color of the back button
        ),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${posts![index].name}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                'Person Name: ${posts![index].userId}',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Field: ${posts![index].field}',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Project ID: ${posts![index].projectId}',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Risk Level: ${posts![index].chanceOfRisk}',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Min Investment: \$${posts![index].minimumInvestment}',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Guaranteed Profit: \$${posts![index].guaranteedProfit}',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Description: ${posts![index].description}',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Time Scale: ${posts![index].timeScale}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        int id = int.parse(posts![index].userId.toString());
                        SingleUser? singleUser =
                            await RemoteService().getEachUsers(id);
                        setState(() {
                          _singleUser = singleUser;
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SixthDisplayingEachUser(
                              enteredId: id.toString(),
                              recipientId: widget.recipientId.toString(),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Pallete.borderColor,
                      ),
                      child: Text(
                        'Chat with the Person',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}



// class Fifthdisplayingallentrepreneurs extends StatefulWidget {
//   final String recipientId;
//   Fifthdisplayingallentrepreneurs({required this.recipientId});

//   @override
//   State<Fifthdisplayingallentrepreneurs> createState() =>
//       _FifthdisplayingallentrepreneursState();
// }

// class _FifthdisplayingallentrepreneursState
//     extends State<Fifthdisplayingallentrepreneurs> {
//   List<Entrepreneurusering>? posts;
//   var isLoaded = false;
//   List<User>? _post;
//   SingleUser? _singleUser;
//   @override
//   void initState() {
//     super.initState();

//     //fetch data from API
//     getData();
//   }

//   getData() async {
//     posts = await RemoteService().getEntrepreneurProjects();
//     if (posts != null) {
//       setState(() {
//         isLoaded = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController texter = new TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Posts'),
//       ),
//       body: Visibility(
//         visible: isLoaded,
//         child: ListView.builder(
//           itemCount: posts?.length,
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
//                           posts![index].userId.toString() ?? '',
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           posts![index].name.toString() ?? '',
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),

//                         Text(
//                           posts![index].field.toString() ?? '',
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           posts![index].projectId.toString() ?? '',
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           posts![index].chanceOfRisk.toString(),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           posts![index].minimumInvestment.toString() ?? '',
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           posts![index].guaranteedProfit.toString() ?? '',
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           posts![index].description.toString() ?? '',
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           posts![index].timeScale.toString() ?? '',
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         ElevatedButton(
//                           onPressed: () async {
//                             int id = int.parse(posts![index].userId.toString());
//                             SingleUser? singleUser =
//                                 await RemoteService().getEachUsers(id);
//                             setState(() {
//                               _singleUser = singleUser;
//                             });
//                             // String name = posts![index].name.toString();
//                             // String collectionName = 'messages_$id$name';
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => SixthDisplayingEachUser(
//                                   // Pass necessary parameters to the next screen if needed
//                                   enteredId: id.toString(),
//                                   recipientId: widget.recipientId.toString(),
//                                   // :
//                                   //     singleUser, // Pass the singleUser to the next screen
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Text('Click Me'),
//                         ),

//                         //editing controller
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



