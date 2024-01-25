import 'package:api_demo/models/investorusering.dart';
import 'package:api_demo/models/post.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/usering.dart';
import 'package:api_demo/models/singleUser.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/views/SixthDisplayingEachUser.dart';

class FifthDisplayingAllInvestors extends StatefulWidget {
  const FifthDisplayingAllInvestors({Key? key}) : super(key: key);

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

    //fetch data from API
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
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts![index].userId.toString() ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          posts![index].fieldOfInvestment.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          posts![index].yearsOfInvestment.toString() ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          posts![index].timeScaleAllowed.toString() ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          posts![index].minimumProfit.toString() ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          posts![index].allowedRisk.toString() ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          posts![index].description.toString() ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
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
