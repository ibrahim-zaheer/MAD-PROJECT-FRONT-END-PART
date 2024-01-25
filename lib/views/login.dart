// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:flutter/material.dart';
// import 'package:api_demo/views/InvestorOrEntrepreneur.dart';

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   List<User>? posts;
//   var isLoaded = false;
//   late TextEditingController idController;
//   late TextEditingController usernameController;
//   late TextEditingController passwordController;
//   late TextEditingController emailController;
//   late TextEditingController phoneNumberController;

//   @override
//   void initState() {
//     super.initState();
//     getData();

//     // Initialize controllers
//     idController = TextEditingController();
//     usernameController = TextEditingController();
//     passwordController = TextEditingController();
//     emailController = TextEditingController();
//     phoneNumberController = TextEditingController();
//   }

//   getData() async {
//     posts = await RemoteService().getUsers();
//     if (posts != null) {
//       setState(() {
//         isLoaded = true;
//       });
//     }
//   }

//   //in case of password is wrong
//   void showAlert(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Error"),
//           content: Text("Credentials are wrong. Cannot go forward."),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the alert dialog
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     var GoForward = true;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Visibility(
//         visible: isLoaded,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: usernameController,
//                 decoration: InputDecoration(labelText: 'Username'),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Password'),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   // Perform login logic here
//                   String enteredUsername = usernameController.text;
//                   String enteredPassword = passwordController.text;

//                   // Check if enteredUsername and enteredPassword match any user from the API
//                   bool isLoginSuccessful = posts!.any((user) =>
//                       user.username == enteredUsername &&
//                       user.password == enteredPassword);

//                   if (isLoginSuccessful) {
//                     // Redirect or perform actions for successful login
//                     print('Login successful!');
//                     if (GoForward == true) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => InvestorOrEntrepreneur(
//                             enteredId: posts!
//                                 .firstWhere((user) =>
//                                     user.username == enteredUsername &&
//                                     user.password == enteredPassword)
//                                 .id
//                                 .toString(),
//                             enteredUsername: enteredUsername,
//                             enteredPassword: enteredPassword,
//                             enteredEmail: posts!
//                                 .firstWhere((user) =>
//                                     user.username == enteredUsername &&
//                                     user.password == enteredPassword)
//                                 .email
//                                 .toString(),
//                             enteredphoneNumber: posts!
//                                 .firstWhere((user) =>
//                                     user.username == enteredUsername &&
//                                     user.password == enteredPassword)
//                                 .phoneNumber
//                                 .toString(),
//                           ),
//                         ),
//                       );
//                     }
//                   } else {
//                     GoForward = false;
//                     // Show error message or perform actions for failed login
//                     showAlert(context);
//                     print('Login failed. Please check your credentials.');
//                   }
//                   GoForward = true;
//                 },
//                 child: const Text('Login'),
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

import 'package:api_demo/models/user.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/views/pallete.dart';
import 'package:api_demo/views/widgets/login_field.dart';
import 'package:api_demo/views/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/views/InvestorOrEntrepreneur.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<User>? posts;
  var isLoaded = false;
  late TextEditingController idController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    super.initState();
    getData();

    // Initialize controllers
    idController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  getData() async {
    posts = await RemoteService().getUsers();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  // in case of password is wrong
  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("Credentials are wrong. Cannot go forward."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var GoForward = true;
    // return Scaffold(
    //   backgroundColor: const Color(0xFFF5F5F5),
    //   // appBar: AppBar(
    //   //   title: const Text('Login'),
    //   // ),
    //   body: Visibility(
    //     visible: isLoaded,
    //     child: Padding(
    //       padding: const EdgeInsets.all(50.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Container(
    //             width: 360,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 const Text(
    //                   'Sign In to \nInvestfy',
    //                   style:
    //                       TextStyle(fontSize: 75, fontWeight: FontWeight.bold),
    //                 ),
    //                 const SizedBox(
    //                   height: 30,
    //                 ),
    //                 const Text(
    //                   "If you don't have an account",
    //                   style: TextStyle(
    //                       color: Colors.black54, fontWeight: FontWeight.bold),
    //                 ),
    //                 const SizedBox(
    //                   height: 10,
    //                 ),
    //                 const Row(
    //                   children: [
    //                     Text('You can',
    //                         style: TextStyle(
    //                             color: Colors.black54,
    //                             fontWeight: FontWeight.bold)),
    //                     SizedBox(
    //                       width: 15,
    //                     ),
    //                     Text(
    //                       'Register here!',
    //                       style: TextStyle(
    //                           color: Colors.deepPurple,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                   ],
    //                 ),
    //                 Image.asset(
    //                   'illustration-2.png', // Replace with your background image asset path
    //                 ),
    //               ],
    //             ),
    //           )
    //           // Image.asset(
    //           //   'assets/coverimage.png', // Replace with your background image asset path
    //           //   fit: BoxFit.cover,
    //           // ),

    //           // TextField(
    //           //   controller: usernameController,
    //           //   decoration: InputDecoration(labelText: 'Username'),
    //           // ),
    //           // TextField(
    //           //   controller: passwordController,
    //           //   obscureText: true,
    //           //   decoration: InputDecoration(labelText: 'Password'),
    //           // ),
    //           // Card(
    //           //   color: Colors.blue, // Sky blue color
    //           //   child: Padding(
    //           //     padding: const EdgeInsets.all(8.0),
    //           //     child: TextField(
    //           //       controller: usernameController,
    //           //       decoration: InputDecoration(labelText: 'Username'),
    //           //     ),
    //           //   ),
    //           // ),
    //           // const SizedBox(height: 16),
    //           // Card(
    //           //   color: Colors.orange, // Orange color
    //           //   child: Padding(
    //           //     padding: const EdgeInsets.all(8.0),
    //           //     child: TextField(
    //           //       controller: passwordController,
    //           //       obscureText: true,
    //           //       decoration: InputDecoration(labelText: 'Password'),
    //           //     ),
    //           // ),
    //           // ),
    //           // const SizedBox(height: 16),
    // ElevatedButton(
    //   onPressed: () {
    //     // Perform login logic here
    //     String enteredUsername = usernameController.text;
    //     String enteredPassword = passwordController.text;

    //     // Check if enteredUsername and enteredPassword match any user from the API
    //     bool isLoginSuccessful = posts!.any((user) =>
    //         user.username == enteredUsername &&
    //         user.password == enteredPassword);

    //     if (isLoginSuccessful) {
    //       // Redirect or perform actions for successful login
    //       print('Login successful!');
    //       if (GoForward == true) {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => InvestorOrEntrepreneur(
    //               enteredId: posts!
    //                   .firstWhere((user) =>
    //                       user.username == enteredUsername &&
    //                       user.password == enteredPassword)
    //                   .id
    //                   .toString(),
    //               enteredUsername: enteredUsername,
    //               enteredPassword: enteredPassword,
    //               enteredEmail: posts!
    //                   .firstWhere((user) =>
    //                       user.username == enteredUsername &&
    //                       user.password == enteredPassword)
    //                   .email
    //                   .toString(),
    //               enteredphoneNumber: posts!
    //                   .firstWhere((user) =>
    //                       user.username == enteredUsername &&
    //                       user.password == enteredPassword)
    //                   .phoneNumber
    //                   .toString(),
    //             ),
    //           ),
    //         );
    //       }
    //     } else {
    //       GoForward = false;
    //       // Show error message or perform actions for failed login
    //       showAlert(context);
    //       print('Login failed. Please check your credentials.');
    //     }
    //     GoForward = true;
    //   },
    //           //   child: const Text('Login'),
    //           // ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/signin_balls.png"),
              const Text(
                'Sign in',
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
              // const SizedBox(height: 30),
              // const SocialButton(
              //     iconPath: '/svgs/g_logo.svg', label: 'Continue with Google'),
              // const SizedBox(height: 10),
              // const SocialButton(
              //   iconPath: '/svgs/f_logo.svg',
              //   label: 'Continue with Facebook',
              //   horizontalPadding: 90,
              // ),
              // const SizedBox(height: 15),
              // const Text(
              //   'or',
              //   style: TextStyle(
              //     color: Pallete.whiteColor,
              //     fontSize: 17,
              //   ),
              // ),
              const SizedBox(height: 20),
              LoginField(
                hintText: 'Username',
                controller: usernameController,
              ),
              const SizedBox(height: 10),
              LoginField(
                hintText: 'Password',
                controller: passwordController,
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
                  onPressed: () {
                    // Perform login logic here
                    String enteredUsername = usernameController.text;
                    String enteredPassword = passwordController.text;

                    // Check if enteredUsername and enteredPassword match any user from the API
                    bool isLoginSuccessful = posts!.any((user) =>
                        user.username == enteredUsername &&
                        user.password == enteredPassword);

                    if (isLoginSuccessful) {
                      // Redirect or perform actions for successful login
                      print('Login successful!');
                      if (GoForward == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InvestorOrEntrepreneur(
                              enteredId: posts!
                                  .firstWhere((user) =>
                                      user.username == enteredUsername &&
                                      user.password == enteredPassword)
                                  .id
                                  .toString(),
                              enteredUsername: enteredUsername,
                              enteredPassword: enteredPassword,
                              enteredEmail: posts!
                                  .firstWhere((user) =>
                                      user.username == enteredUsername &&
                                      user.password == enteredPassword)
                                  .email
                                  .toString(),
                              enteredphoneNumber: posts!
                                  .firstWhere((user) =>
                                      user.username == enteredUsername &&
                                      user.password == enteredPassword)
                                  .phoneNumber
                                  .toString(),
                            ),
                          ),
                        );
                      }
                    } else {
                      GoForward = false;
                      // Show error message or perform actions for failed login
                      showAlert(context);
                      print('Login failed. Please check your credentials.');
                    }
                    GoForward = true;
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
