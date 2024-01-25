import 'package:api_demo/models/investorusering.dart';
import 'package:api_demo/models/post.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/usering.dart';
import 'package:api_demo/models/singleUser.dart';
import 'package:api_demo/models/investring.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/views/SixthDisplayingEachUser.dart';

class GettingEachInvestorProject extends StatefulWidget {
  final String userId;
  const GettingEachInvestorProject({required this.userId});

  @override
  State<GettingEachInvestorProject> createState() =>
      _GettingEachInvestorProjectState();
}

class _GettingEachInvestorProjectState
    extends State<GettingEachInvestorProject> {
  List<Investring>? posts;
  var isLoaded = false;
  SingleUser? _singleUser;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts =
        await RemoteService().getEachInvestorProjects(int.parse(widget.userId));
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController texter = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Card(
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

                          ElevatedButton(
                            onPressed: () async {
                              int id =
                                  int.parse(posts![index].userId.toString());
                              SingleUser? singleUser =
                                  await RemoteService().getEachUsers(id);
                              setState(() {
                                _singleUser = singleUser;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SixthDisplayingEachUser(
                                    // Pass necessary parameters to the next screen if needed
                                    enteredId: id.toString(),
                                    // :
                                    //     singleUser, // Pass the singleUser to the next screen
                                  ),
                                ),
                              );
                            },
                            child: Text('Click Me'),
                          ),

                          //editing controller
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
