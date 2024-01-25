// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/models/post.dart';
// import 'package:api_demo/views/InvestorOrEntrepreneur.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:flutter/material.dart';
// import 'package:api_demo/views/login.dart';

// class creatingProfile extends StatefulWidget {
//   const creatingProfile({Key? key}) : super(key: key);

//   @override
//   State<creatingProfile> createState() => _creatingProfileState();
// }

// class _creatingProfileState extends State<creatingProfile> {
//   List<User>? posts;
//   var isLoaded = false;

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

//   TextEditingController Namer = new TextEditingController();
//   TextEditingController Emailer = new TextEditingController();
//   TextEditingController Passworder = new TextEditingController();
//   TextEditingController PhoneNumberer = new TextEditingController();
//   // TextEditingController createDate = new TextEditingController();

//   List<User>? _post;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Creating User Profile'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             child: Column(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: "Enter Name here"),
//                   controller: Namer,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: "Enter email here"),
//                   controller: Emailer,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: "Enter password here"),
//                   controller: Passworder,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: "Enter phone number here"),
//                   controller: PhoneNumberer,
//                 ),
//               ],
//             ),
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 String name = Namer.text;
//                 String email = Emailer.text;
//                 String password = Passworder.text;
//                 String phoneNumber = PhoneNumberer.text;
//                 // DateTime created = DateTime.parse(createDate.text);
//                 List<User>? post = await RemoteService()
//                     .sendUsers(name, password, email, phoneNumber);

//                 setState(() {
//                   _post = post;
//                 });
//               },
//               child: Text("Click on me")),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:api_demo/views/login.dart';

// class creatingProfile extends StatefulWidget {
//   const creatingProfile({Key? key}) : super(key: key);

//   @override
//   State<creatingProfile> createState() => _creatingProfileState();
// }

// class _creatingProfileState extends State<creatingProfile> {
//   List<User>? posts;
//   var isLoaded = false;

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

//   TextEditingController Namer = TextEditingController();
//   TextEditingController Emailer = TextEditingController();
//   TextEditingController Passworder = TextEditingController();
//   TextEditingController PhoneNumberer = TextEditingController();

//   List<User>? _post;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Creating User Profile'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             child: Column(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: "Enter Name here",
//                   ),
//                   controller: Namer,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: "Enter email here",
//                   ),
//                   controller: Emailer,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: "Enter password here",
//                   ),
//                   controller: Passworder,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: "Enter phone number here",
//                   ),
//                   controller: PhoneNumberer,
//                 ),
//               ],
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               String name = Namer.text;
//               String email = Emailer.text;
//               String password = Passworder.text;
//               String phoneNumber = PhoneNumberer.text;

//               // Simulate API call
//               // Replace the following line with your actual API call
//               // List<User>? post = await RemoteService().sendUsers(name, password, email, phoneNumber);

//               // Show thank you message in an alert dialog
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: Text("Thank You for Joining!"),
//                     content: Text("You have successfully joined."),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           // Navigate to login.dart after acknowledging the alert
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Login()),
//                           );
//                         },
//                         child: Text("OK"),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//             child: Text("Click on me"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:api_demo/views/login.dart';
// import 'package:url_launcher/url_launcher.dart';

// class creatingProfile extends StatefulWidget {
//   const creatingProfile({Key? key}) : super(key: key);

//   @override
//   State<creatingProfile> createState() => _creatingProfileState();
// }

// class _creatingProfileState extends State<creatingProfile> {
//   List<User>? posts;
//   var isLoaded = false;

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

//   TextEditingController Namer = TextEditingController();
//   TextEditingController Emailer = TextEditingController();
//   TextEditingController Passworder = TextEditingController();
//   TextEditingController PhoneNumberer = TextEditingController();

//   List<User>? _post;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Creating User Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Image(
//               image: AssetImage('assets/hulk.jpg'),
//               width: 200, // Adjust width as needed
//               height: 200, // Adjust height as needed
//             ),
//             Container(
//               child: Column(
//                 children: [
//                   TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: "Enter Name here",
//                     ),
//                     controller: Namer,
//                   ),
//                   TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: "Enter email here",
//                     ),
//                     controller: Emailer,
//                   ),
//                   TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: "Enter password here",
//                     ),
//                     controller: Passworder,
//                   ),
//                   TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: "Enter phone number here",
//                     ),
//                     controller: PhoneNumberer,
//                   ),
//                 ],
//               ),
//             ),

//             ElevatedButton(
//               onPressed: () async {
//                 String name = Namer.text;
//                 String email = Emailer.text;
//                 String password = Passworder.text;
//                 String phoneNumber = PhoneNumberer.text;

//                 // Simulate API call
//                 // Replace the following line with your actual API call
//                 // List<User>? post = await RemoteService().sendUsers(name, password, email, phoneNumber);

//                 // Show thank you message in an alert dialog
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text("Thank You for Joining!"),
//                       content: Text("You have successfully joined."),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             // Navigate to login.dart after acknowledging the alert
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => Login()),
//                             );
//                           },
//                           child: Text("OK"),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: Text("Click on me"),
//             ),
//             SizedBox(height: 20),
//             // Add the YouTube text with a clickable GestureDetector
//             GestureDetector(
//               onTap: () {
//                 // Navigate to YouTube when the text is clicked
//                 // Replace the URL with the actual YouTube URL
//                 launch('https://www.youtube.com');
//               },
//               child: Text(
//                 "YouTube",
//                 style: TextStyle(
//                   color: Colors
//                       .blue, // Make the text color blue for a link-like appearance
//                   decoration: TextDecoration.underline,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:api_demo/views/pallete.dart';
import 'package:api_demo/views/widgets/login_field.dart';
import 'package:api_demo/views/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/views/login.dart';
import 'package:url_launcher/url_launcher.dart';

class creatingProfile extends StatefulWidget {
  const creatingProfile({Key? key}) : super(key: key);

  @override
  State<creatingProfile> createState() => _creatingProfileState();
}

class _creatingProfileState extends State<creatingProfile> {
  List<User>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();

    // Start the animation loop
    startAnimation();
  }

  getData() async {
    posts = await RemoteService().getUsers();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  TextEditingController Namer = TextEditingController();
  TextEditingController Emailer = TextEditingController();
  TextEditingController Passworder = TextEditingController();
  TextEditingController PhoneNumberer = TextEditingController();

  List<User>? _post;

  double circle1Top = 50;
  double circle1Left = 50;
  double circle2Top = 100;
  double circle2Left = 200;

  // Animation loop
  void startAnimation() {
    Future.delayed(Duration(milliseconds: 16), () {
      // Update circle positions
      setState(() {
        circle1Top += 1;
        circle1Left += 1;

        circle2Top -= 1;
        circle2Left -= 1;
      });

      // Call the animation loop again
      startAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Pallete.backgroundColor, // Set the background color to dark green
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/signin_balls.png'),
              const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
              const Text(
                'to',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
              const Text(
                'Investfy',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
              const SizedBox(height: 30),

              const SizedBox(height: 10),
              LoginField(
                hintText: "Name",
                controller: Namer,
              ),
              const SizedBox(height: 10),
              LoginField(
                hintText: 'Email',
                controller: Emailer,
              ),
              const SizedBox(height: 10),

              LoginField(
                hintText: 'Password',
                controller: Passworder,
              ),
              const SizedBox(height: 10),
              LoginField(
                hintText: 'PhoneNumber',
                controller: PhoneNumberer,
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Pallete.gradient1,
                      Pallete.gradient2,
                      Pallete.gradient3,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(395, 55),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () async {
                    String name = Namer.text;
                    String email = Emailer.text;
                    String password = Passworder.text;
                    String phoneNumber = PhoneNumberer.text;

                    // Simulate API call
                    // Replace the following line with your actual API call
                    List<User>? post = await RemoteService()
                        .sendUsers(name, password, email, phoneNumber);

                    // Show thank you message in an alert dialog
                    if (name != "" ||
                        email != "" ||
                        password != "" ||
                        phoneNumber != "") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Thank You for Joining!"),
                            content: Text("You have successfully joined."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Navigate to login.dart after acknowledging the alert
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Empty Data"),
                            content: Text("Please Fill All the Data."),
                          );
                        },
                      );
                    }
                  },
                  child: Text("Sign Up"),
                ),
              ),
              SizedBox(height: 20),
              // Add the YouTube text with a clickable GestureDetector
            ],
          ),
        ),
      ),
      // Add green-colored circles around the widget

      // Add more AnimatedPositioned widgets as needed for additional circles
    );
  }
}
