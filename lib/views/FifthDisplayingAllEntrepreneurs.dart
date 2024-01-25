import 'package:api_demo/models/entrepreneurusering.dart';
import 'package:api_demo/models/investorusering.dart';
import 'package:api_demo/models/singleUser.dart';

import 'package:api_demo/models/post.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/usering.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/views/SixthDisplayingEachUser.dart';

class Fifthdisplayingallentrepreneurs extends StatefulWidget {
  const Fifthdisplayingallentrepreneurs({Key? key}) : super(key: key);

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
  double? minInvestment;
  double? maxInvestment;
  double? minGuaranteedProfit;
  double? maxGuaranteedProfit;

  @override
  void initState() {
    super.initState();

    if (minInvestment == null) {
      getData1();
    } else {
      getData(maxInvestment: 45);
    }
  }

  getData1() async {
    posts = await RemoteService().getEntrepreneurProjects();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  getData({
    minInvestment,
    maxInvestment,
    minGuaranteedProfit,
    maxGuaranteedProfit,
  }) async {
    posts = await RemoteService().getFilteredEntrepreneurProjects(
      minInvestment: minInvestment,
      maxInvestment: maxInvestment,
      minGuaranteedProfit: minGuaranteedProfit,
      maxGuaranteedProfit: maxGuaranteedProfit,
    );

    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController texter = new TextEditingController();
    // You can set a default value if needed
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
                          posts![index].name.toString() ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),

                        Text(
                          posts![index].field.toString() ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          posts![index].projectId.toString() ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          posts![index].chanceOfRisk.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          posts![index].minimumInvestment.toString() ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          posts![index].guaranteedProfit.toString() ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          posts![index].description.toString() ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          posts![index].timeScale.toString() ?? '',
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
                            // String name = posts![index].name.toString();
                            // String collectionName = 'messages_$id$name';
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
