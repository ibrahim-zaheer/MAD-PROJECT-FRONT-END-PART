// //Fix this code

// import 'package:api_demo/views/pallete.dart';
// import 'package:api_demo/views/widgets/griddashboard.dart';
// import 'package:api_demo/views/widgets/navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:api_demo/views/home_page.dart';
// import 'package:api_demo/views/display_page.dart';
// import 'package:api_demo/views/display_users.dart';
// import 'package:api_demo/views/login.dart';
// import 'package:api_demo/views/creating_profile.dart';
// import 'package:api_demo/views/oneAfterSelectingRole.dart';
// import 'package:api_demo/views/EigthDeletingProperProfile.dart';
// import 'package:api_demo/views/delete/DeletingUserProfile.dart';
// import 'package:api_demo/views/update/updatingProfile.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/views/SixthDisplayingEachUser.dart';
// import 'package:api_demo/models/entrepreneurusering.dart';
// import 'package:api_demo/models/investorusering.dart';
// import 'package:api_demo/models/singleUser.dart';

// import 'package:api_demo/models/post.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:flutter/material.dart';
// import 'package:api_demo/models/post.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/models/singleUser.dart'; // Import SingleUser model
// import 'package:api_demo/services/remote_service.dart';
// // import 'package:api_demo/views/SeventhDisplayProperFile.dart';
// import 'package:api_demo/views/update/displayProperFile.dart';
// import 'package:api_demo/views/update/updatingProperProfile.dart';

// import 'package:api_demo/models/entrepreneurusering.dart';
// import 'package:api_demo/models/investorusering.dart';
// import 'package:api_demo/models/singleUser.dart';

// import 'package:api_demo/models/post.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/models/usering.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:flutter/material.dart';
// import 'package:api_demo/views/SixthDisplayingEachUser.dart';
// // import 'package:api_demo/views/FifthDisplayingAllEntrepreneurs.dart';
// // import 'package:api_demo/views/FifthDisplayingAllInvestors.dart';
// import 'package:api_demo/views/Investor/creatingInvestorProjects.dart';
// import 'package:api_demo/views/entrepreneur/creatingEntrepreneurProjectAgain.dart';
// import 'package:api_demo/views/chatApp/ForEntrepreneursPrivateMessaging/Display_each_Entrepreneur_user.dart';
// import 'package:api_demo/views/chatApp/ForEntrepreneursPrivateMessaging/ViewAllEntrepreneurs.dart';
// //for investor
// import 'package:api_demo/views/chatApp/ForInvestorProfile/ViewAllinvestors.dart';
// import 'package:api_demo/views/ToDoApp/toDoapp.dart';
// import 'package:api_demo/views/ToDoApp/screens/home.dart';
// import 'package:api_demo/views/calculator/calculator.dart';

// //for projects
// import 'package:api_demo/views/projects/gettingEachProject.dart';
// import 'package:api_demo/views/projects/gettingEachInvestorProject.dart';

// class ninthSecondAfterLoginPage extends StatefulWidget {
//   final String enteredId;
//   final String enteredUsername;
//   final String enteredPassword;
//   final String enteredEmail;
//   final String enteredphoneNumber;

//   ninthSecondAfterLoginPage({
//     required this.enteredId,
//     required this.enteredUsername,
//     required this.enteredPassword,
//     required this.enteredEmail,
//     required this.enteredphoneNumber,
//   });

//   @override
//   State<ninthSecondAfterLoginPage> createState() =>
//       _ninthSecondAfterLoginPageState();
// }

// class _ninthSecondAfterLoginPageState extends State<ninthSecondAfterLoginPage> {
//   SingleUser? singleUser; // Change the type to SingleUser?
//   var isLoaded = false;
//   List<User>? _post;
//   SingleUser? _singleUser;
//   List<Entrepreneurusering>? posts;
//   TextEditingController namer = new TextEditingController();

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
//     String name = widget.enteredUsername;
//     String email = widget.enteredEmail;
//     return Scaffold(
//       drawer: NavBar(
//         enteredUsername: name,
//         enteredEmail: email,
//         enteredId: widget.enteredId,
//         enteredPassword: widget.enteredPassword,
//         enteredphoneNumber: widget.enteredphoneNumber,
//       ),
//       backgroundColor: Pallete.backgroundColor,
//       appBar: AppBar(
//         backgroundColor: Pallete.backgroundColor,
//         title: const Text('Investfy'),
//         titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
//         iconTheme: IconThemeData(color: Colors.white, size: 24),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // Text(
//               //   singleUser!.username.toString(),
//               //   maxLines: 3,
//               //   overflow: TextOverflow.ellipsis,
//               // ),
//               // Text(
//               //   singleUser!.phoneNumber.toString(),
//               //   maxLines: 3,
//               //   overflow: TextOverflow.ellipsis,
//               // ),
//               // Text(
//               //   singleUser!.email.toString(),
//               //   maxLines: 3,
//               //   overflow: TextOverflow.ellipsis,
//               // ),
//               // Text(
//               //   singleUser!.role.toString(),
//               //   maxLines: 3,
//               //   overflow: TextOverflow.ellipsis,
//               // ),
//               // ElevatedButton(
//               //   onPressed: () async {
//               //     int id = int.parse(singleUser!.id.toString());
//               //     SingleUser? singleUsers =
//               //         await RemoteService().getEachUsers(id);
//               //     setState(() {
//               //       _singleUser = singleUsers;
//               //     });
//               //     Navigator.push(
//               //       context,
//               //       MaterialPageRoute(
//               //         builder: (context) => SeventhDisplayProperFile(
//               //           // Pass necessary parameters to the next screen if needed
//               //           enteredId: id.toString(),
//               //           // :
//               //           //     singleUser, // Pass the singleUser to the next screen
//               //         ),
//               //       ),
//               //     );
//               //   },
//               //   child: Text(
//               //       'Click here viewing your personal details for personal details'),
//               // ),
//               // // SizedBox(height: 20),
//               // ElevatedButton(
//               //     onPressed: () async {
//               //       int id = int.parse(widget.enteredId);

//               //       Navigator.push(
//               //         context,
//               //         MaterialPageRoute(
//               //             builder: (context) => EightDeletingProperProfile(
//               //                 enteredId: id.toString())),
//               //       );
//               //     },
//               //     child: Text("Delete your profile")),

//               // this code was added recently
//               ElevatedButton(
//                   onPressed: () async {
//                     int id = int.parse(widget.enteredId);

//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => makingInvestorProject(
//                                 enteredId: id.toString(),
//                                 enteredUsername: widget.enteredUsername,
//                                 enteredEmail: widget.enteredEmail,
//                                 enteredPassword: widget.enteredPassword,
//                                 enteredphoneNumber: widget.enteredphoneNumber,
//                               )),
//                     );
//                   },
//                   child: Text("Create the investor project")),
//               // SizedBox(height: 20),
//               ElevatedButton(
//                   onPressed: () async {
//                     int id = int.parse(widget.enteredId);

//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => MakingEntreprenuerProject(
//                                 enteredId: id.toString(),
//                                 enteredUsername: widget.enteredUsername,
//                                 enteredEmail: widget.enteredEmail,
//                                 enteredPassword: widget.enteredPassword,
//                                 enteredphoneNumber: widget.enteredphoneNumber,
//                               )),
//                     );
//                   },
//                   child: Text("Create the entrepreneur project")),

//               ElevatedButton(
//                   onPressed: () async {
//                     int id = int.parse(widget.enteredId);
//                     String recieverID = id.toString();
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => FifthDisplayingAllInvestors(
//                                 recipientId: recieverID,
//                               )),
//                     );
//                   },
//                   child: Text("View all Investor profiles")),

//               ElevatedButton(
//                   onPressed: () async {
//                     int id = int.parse(widget.enteredId);
//                     String recieverID = id.toString();
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Fifthdisplayingallentrepreneurs(
//                                 recipientId: recieverID,
//                               )),
//                     );
//                   },
//                   child: Text("View all entrepreneurs profiles")),
//               ElevatedButton(
//                   onPressed: () async {
//                     int id = int.parse(widget.enteredId);
//                     String recieverID = id.toString();
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Home()),
//                     );
//                   },
//                   child: Text("Open ToDO List")),
//               ElevatedButton(
//                   onPressed: () async {
//                     int id = int.parse(widget.enteredId);
//                     String recieverID = id.toString();
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => CalculatorScreen()),
//                     );
//                   },
//                   child: Text("Open Calculator")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//Fix this code

import 'package:api_demo/views/pallete.dart';
import 'package:api_demo/views/widgets/griddashboard.dart';
import 'package:api_demo/views/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/views/home_page.dart';
import 'package:api_demo/views/display_page.dart';
import 'package:api_demo/views/display_users.dart';
import 'package:api_demo/views/login.dart';
import 'package:api_demo/views/creating_profile.dart';
import 'package:api_demo/views/oneAfterSelectingRole.dart';
import 'package:api_demo/views/EigthDeletingProperProfile.dart';
import 'package:api_demo/views/delete/DeletingUserProfile.dart';
import 'package:api_demo/views/update/updatingProfile.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/views/SixthDisplayingEachUser.dart';
import 'package:api_demo/models/entrepreneurusering.dart';
import 'package:api_demo/models/investorusering.dart';
import 'package:api_demo/models/singleUser.dart';

import 'package:api_demo/models/post.dart';
import 'package:api_demo/models/user.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/models/post.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/singleUser.dart'; // Import SingleUser model
import 'package:api_demo/services/remote_service.dart';
// import 'package:api_demo/views/SeventhDisplayProperFile.dart';
import 'package:api_demo/views/update/displayProperFile.dart';
import 'package:api_demo/views/update/updatingProperProfile.dart';

import 'package:api_demo/models/entrepreneurusering.dart';
import 'package:api_demo/models/investorusering.dart';
import 'package:api_demo/models/singleUser.dart';

import 'package:api_demo/models/post.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/usering.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/views/SixthDisplayingEachUser.dart';
// import 'package:api_demo/views/FifthDisplayingAllEntrepreneurs.dart';
// import 'package:api_demo/views/FifthDisplayingAllInvestors.dart';
import 'package:api_demo/views/Investor/creatingInvestorProjects.dart';
import 'package:api_demo/views/entrepreneur/creatingEntrepreneurProjectAgain.dart';
import 'package:api_demo/views/chatApp/ForEntrepreneursPrivateMessaging/Display_each_Entrepreneur_user.dart';
import 'package:api_demo/views/chatApp/ForEntrepreneursPrivateMessaging/ViewAllEntrepreneurs.dart';
//for investor
import 'package:api_demo/views/chatApp/ForInvestorProfile/ViewAllinvestors.dart';
import 'package:api_demo/views/ToDoApp/toDoapp.dart';
import 'package:api_demo/views/ToDoApp/screens/home.dart';
import 'package:api_demo/views/calculator/calculator.dart';

//for projects
import 'package:api_demo/views/projects/gettingEachProject.dart';
import 'package:api_demo/views/projects/gettingEachInvestorProject.dart';

class ninthSecondAfterLoginPage extends StatefulWidget {
  final String enteredId;
  final String enteredUsername;
  final String enteredPassword;
  final String enteredEmail;
  final String enteredphoneNumber;

  ninthSecondAfterLoginPage({
    required this.enteredId,
    required this.enteredUsername,
    required this.enteredPassword,
    required this.enteredEmail,
    required this.enteredphoneNumber,
  });

  @override
  State<ninthSecondAfterLoginPage> createState() =>
      _ninthSecondAfterLoginPageState();
}

class _ninthSecondAfterLoginPageState extends State<ninthSecondAfterLoginPage> {
  SingleUser? singleUser; // Change the type to SingleUser?
  var isLoaded = false;
  List<User>? _post;
  SingleUser? _singleUser;
  List<Entrepreneurusering>? posts;
  TextEditingController namer = new TextEditingController();

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
    String name = widget.enteredUsername;
    String email = widget.enteredEmail;
    return Scaffold(
      drawer: NavBar(
        enteredUsername: name,
        enteredEmail: email,
        enteredId: widget.enteredId,
        enteredPassword: widget.enteredPassword,
        enteredphoneNumber: widget.enteredphoneNumber,
      ),
      backgroundColor: Pallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        title: const Text('Investfy'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        iconTheme: IconThemeData(color: Colors.white, size: 24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              buildCard(
                onPressed: () async {
                  int id = int.parse(widget.enteredId);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => makingInvestorProject(
                        enteredId: id.toString(),
                        enteredUsername: widget.enteredUsername,
                        enteredEmail: widget.enteredEmail,
                        enteredPassword: widget.enteredPassword,
                        enteredphoneNumber: widget.enteredphoneNumber,
                      ),
                    ),
                  );
                },
                label: "Create the Investor Project",
                color: const Color.fromARGB(255, 66, 66, 66),
                icon: Icons.person,
              ),
              const SizedBox(height: 16),
              buildCard(
                onPressed: () async {
                  int id = int.parse(widget.enteredId);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MakingEntreprenuerProject(
                        enteredId: id.toString(),
                        enteredUsername: widget.enteredUsername,
                        enteredEmail: widget.enteredEmail,
                        enteredPassword: widget.enteredPassword,
                        enteredphoneNumber: widget.enteredphoneNumber,
                      ),
                    ),
                  );
                },
                label: "Create the Entrepreneur Project",
                color: const Color.fromARGB(255, 66, 66, 66),
                icon: Icons.business,
              ),
              const SizedBox(height: 16),
              buildCard(
                onPressed: () async {
                  int id = int.parse(widget.enteredId);
                  String recieverID = id.toString();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FifthDisplayingAllInvestors(
                        recipientId: recieverID,
                      ),
                    ),
                  );
                },
                label: "View all Investor profiles",
                color: const Color.fromARGB(255, 66, 66, 66),
                icon: Icons.people,
              ),
              const SizedBox(height: 16),
              buildCard(
                onPressed: () async {
                  int id = int.parse(widget.enteredId);
                  String recieverID = id.toString();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Fifthdisplayingallentrepreneurs(
                        recipientId: recieverID,
                      ),
                    ),
                  );
                },
                label: "View all Entrepreneur profiles",
                color: const Color.fromARGB(255, 66, 66, 66),
                icon: Icons.business_center,
              ),
              const SizedBox(height: 16),
              buildCard(
                onPressed: () async {
                  int id = int.parse(widget.enteredId);
                  String recieverID = id.toString();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                label: "Open ToDO List",
                color: const Color.fromARGB(255, 66, 66, 66),
                icon: Icons.list,
              ),
              const SizedBox(height: 16),
              buildCard(
                onPressed: () async {
                  int id = int.parse(widget.enteredId);
                  String recieverID = id.toString();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculatorScreen()),
                  );
                },
                label: "Open Calculator",
                color: const Color.fromARGB(255, 66, 66, 66),
                icon: Icons.calculate,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard({
    required VoidCallback onPressed,
    required String label,
    required Color color,
    required IconData icon,
  }) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 32,
        ),
        title: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
