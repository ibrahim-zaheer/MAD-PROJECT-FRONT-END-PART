import 'package:flutter/material.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/views/oneAfterSelectingRole.dart';

class InvestorOrEntrepreneur extends StatefulWidget {
  final String enteredId;
  final String enteredUsername;
  final String enteredPassword;
  final String enteredEmail;
  final String enteredphoneNumber;

  InvestorOrEntrepreneur({
    required this.enteredId,
    required this.enteredUsername,
    required this.enteredPassword,
    required this.enteredEmail,
    required this.enteredphoneNumber,
  });

  @override
  State<InvestorOrEntrepreneur> createState() => _InvestorOrEntrepreneurState();
}

class _InvestorOrEntrepreneurState extends State<InvestorOrEntrepreneur> {
  List<String> deviceTokens = ["device_token_1", "device_token_2"];
  List<User>? posts;
  var isLoaded = false;
  String selectedOption = '';
  List<User>? _post;

  @override
  void initState() {
    super.initState();

    // Fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getUsers();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Choose your role:',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              SizedBox(height: 20),
              Image(
                image: AssetImage('assets/InvestorSelection.jpg'),
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedOption = 'Investor';
                  });
                },
                child: Text('Investor', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                  onPrimary: Colors.white, // Text color
                ),
              ),
              SizedBox(height: 20),
              Image(
                image: AssetImage('assets/Entrepreneur.jpg'),
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedOption = 'Entrepreneur';
                  });
                },
                child: Text('Entrepreneur', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Background color
                  onPrimary: Colors.white, // Text color
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Selected Option: $selectedOption',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  int id = int.parse(widget.enteredId);
                  String name = widget.enteredUsername;
                  String email = widget.enteredEmail;
                  String password = widget.enteredPassword;
                  String phoneNumber = widget.enteredphoneNumber;
                  String role = selectedOption;
                  RemoteService remoteService = RemoteService();
                  List<User>? post =
                      await remoteService.sendInvestorOrEntrepreneur(
                    id,
                    name,
                    password,
                    email,
                    phoneNumber,
                    role,
                  );
                  await remoteService.sendPushNotification();
                  setState(() {
                    _post = post;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => oneAfterSelectingRole(
                        enteredId: widget.enteredId,
                        enteredUsername: widget.enteredUsername,
                        enteredPassword: widget.enteredPassword,
                        enteredEmail: widget.enteredEmail,
                        enteredphoneNumber: widget.enteredphoneNumber,
                        enteredRole: selectedOption,
                      ),
                    ),
                  );
                },
                child: Text("Click on me", style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                  onPrimary: Colors.white, // Text color
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:api_demo/views/home_page.dart';
// import 'package:api_demo/views/display_page.dart';
// import 'package:api_demo/views/display_users.dart';
// import 'package:api_demo/views/login.dart';
// import 'package:api_demo/views/creating_profile.dart';
// import 'package:api_demo/views/oneAfterSelectingRole.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:api_demo/models/user.dart';

// class InvestorOrEntrepreneur extends StatefulWidget {
//   final String enteredId;
//   final String enteredUsername;
//   final String enteredPassword;
//   final String enteredEmail;
//   final String enteredphoneNumber;
//   InvestorOrEntrepreneur(
//       {required this.enteredId,
//       required this.enteredUsername,
//       required this.enteredPassword,
//       required this.enteredEmail,
//       required this.enteredphoneNumber});

//   @override
//   State<InvestorOrEntrepreneur> createState() => _InvestorOrEntrepreneurState();
// }

// class _InvestorOrEntrepreneurState extends State<InvestorOrEntrepreneur> {
//   List<String> deviceTokens = ["device_token_1", "device_token_2"];
//   List<User>? posts;
//   var isLoaded = false;
//   String selectedOption = '';
//   List<User>? _post;

//   @override
//   void initState() {
//     super.initState();

//     //fetch data from API
//     getData();
//   }

//   getData() async {
//     posts = await RemoteService().getUsers();
//     if (posts != null) {
//       setState(() {
//         isLoaded = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Details'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Choose your role:',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   selectedOption = 'Investor';
//                 });
//               },
//               child: Text('Investor'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   selectedOption = 'Entrepreneur';
//                 });
//               },
//               child: Text('Entrepreneur'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Selected Option: $selectedOption',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//                 onPressed: () async {
//                   int id = int.parse(widget.enteredId);
//                   String name = widget.enteredUsername;
//                   String email = widget.enteredEmail;
//                   String password = widget.enteredPassword;
//                   String phoneNumber = widget.enteredphoneNumber;
//                   String role = selectedOption;
//                   RemoteService remoteService = RemoteService();
//                   // DateTime created = DateTime.parse(createDate.text);
//                   List<User>? post = await RemoteService()
//                       .sendInvestorOrEntrepreneur(
//                           id, name, password, email, phoneNumber, role);
//                   await remoteService.sendPushNotification();
//                   setState(() {
//                     _post = post;
//                   });
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => oneAfterSelectingRole(
//                         // Pass necessary parameters to the next screen if needed
//                         enteredId: widget.enteredId,
//                         enteredUsername: widget.enteredUsername,
//                         enteredPassword: widget.enteredPassword,
//                         enteredEmail: widget.enteredEmail,
//                         enteredphoneNumber: widget.enteredphoneNumber,
//                         enteredRole: selectedOption,
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text("Click on me"))
//           ],
//         ),
//       ),
//     );
//   }
// }













//   Widget build(BuildContext context) {
//     return const Scaffold(body: const NavigationWrapper());
//   }
// }

// class NavigationWrapper extends StatefulWidget {
//   const NavigationWrapper({Key? key}) : super(key: key);

//   @override
//   _NavigationWrapperState createState() => _NavigationWrapperState();
// }

// class _NavigationWrapperState extends State<NavigationWrapper> {
//   int _currentIndex = 0;
//   final List<Widget> _pages = [
//     const HomePage(),
//     const display_page(),
//     const DisplayUsers(),
//     const Login(),
//     const creatingProfile()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Choose'),
//       ),
//       body: Text("Hello how are you?"),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         backgroundColor: Colors.purple,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.pageview),
//             label: 'Display',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.pageview),
//             label: 'Users',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.pageview),
//             label: 'Login',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.pageview),
//             label: 'Create a profile',
//           ),
//         ],
//       ),
//     );
//   }
// }














//body:
//Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         'Entered Username: ${widget.enteredUsername}',
      //         style: TextStyle(fontSize: 18),
      //       ),
      //       SizedBox(height: 10),
      //       Text(
      //         'Entered Password: ${widget.enteredPassword}',
      //         style: TextStyle(fontSize: 18),
      //       ),
      //       SizedBox(height: 10),
      //       Text(
      //         'Entered Phone Number: ${widget.enteredphoneNumber}',
      //         style: TextStyle(fontSize: 18),
      //       ),
      //       SizedBox(height: 10),
      //       Text(
      //         'Entered Email Number: ${widget.enteredEmail}',
      //         style: TextStyle(fontSize: 18),
      //       ),
      //       SizedBox(height: 10),
      //       Text(
      //         'Entered ID Number: ${widget.enteredId}',
      //         style: TextStyle(fontSize: 18),
      //       ),

      //       // Add more widgets to display other data as needed
      //     ],