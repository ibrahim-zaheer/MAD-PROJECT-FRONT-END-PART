// import 'package:api_demo/models/investorusering.dart';
// import 'package:api_demo/models/post.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/models/usering.dart';
// import 'package:api_demo/models/singleUser.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:flutter/material.dart';
// import 'package:api_demo/views/chatApp/ForInvestorProfile/display_each_investor.dart';

// class FifthDisplayingAllInvestors extends StatefulWidget {
//   final String recipientId;
//   FifthDisplayingAllInvestors({required this.recipientId});

//   @override
//   State<FifthDisplayingAllInvestors> createState() =>
//       _FifthDisplayingAllInvestorsState();
// }

// class _FifthDisplayingAllInvestorsState
//     extends State<FifthDisplayingAllInvestors> {
//   List<InvestorUsering>? posts;
//   var isLoaded = false;
//   SingleUser? _singleUser;
//   @override
//   void initState() {
//     super.initState();

//     //fetch data from API
//     getData();
//   }

//   getData() async {
//     posts = await RemoteService().getInvestorProjects();
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
//                           posts![index].fieldOfInvestment.toString(),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           posts![index].yearsOfInvestment.toString() ?? '',
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           posts![index].timeScaleAllowed.toString() ?? '',
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           posts![index].minimumProfit.toString() ?? '',
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           posts![index].allowedRisk.toString() ?? '',
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           posts![index].description.toString() ?? '',
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
import 'package:api_demo/models/investorusering.dart';
import 'package:api_demo/models/singleUser.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/views/pallete.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/views/chatApp/ForInvestorProfile/display_each_investor.dart';

class FifthDisplayingAllInvestors extends StatefulWidget {
  final String recipientId;
  FifthDisplayingAllInvestors({required this.recipientId});

  @override
  State<FifthDisplayingAllInvestors> createState() =>
      _FifthDisplayingAllInvestorsState();
}

class _FifthDisplayingAllInvestorsState
    extends State<FifthDisplayingAllInvestors> {
  List<InvestorUsering>? posts;
  var isLoaded = false;
  SingleUser? _singleUser;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getInvestorProjects();
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
          'Investor Projects',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color of the back button
        ),
        backgroundColor: Pallete.backgroundColor,
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
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Field of Investment: ${posts![index].fieldOfInvestment}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'User ID: ${posts![index].userId}',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Years of Investment: ${posts![index].yearsOfInvestment}',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Time Scale Allowed: ${posts![index].timeScaleAllowed}',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Minimum Profit: \$${posts![index].minimumProfit}',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Allowed Risk: ${posts![index].allowedRisk}',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Description: ${posts![index].description}',
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
