// import 'package:flutter/material.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/views/AfterProfileCreationInvestorEntrepreneur/afterThirdPartProfileCreation.dart';

// class makingInvestorProject extends StatefulWidget {
//   final String enteredId;
//   final String enteredUsername;
//   final String enteredPassword;
//   final String enteredEmail;
//   final String enteredphoneNumber;

//   makingInvestorProject({
//     required this.enteredId,
//     required this.enteredUsername,
//     required this.enteredPassword,
//     required this.enteredEmail,
//     required this.enteredphoneNumber,
//   });

//   @override
//   State<makingInvestorProject> createState() =>
//       _thirdafterMakingInvestorState();
// }

// class _thirdafterMakingInvestorState extends State<makingInvestorProject> {
//   List<User>? posts;
//   var isLoaded = false;
//   String selectedOption = '';
//   List<User>? _post;
//   int selectedInvestment = 1;
//   int selectedExperience = 1;
//   int selectedMinimumProfit = 1;
//   // String selectedField = ''; // Added for dropdown

//   List<String> fieldsList = [
//     'Food',
//     'Clothing',
//     'Retail',
//     'Finance', // Added
//     'Software', // Added
//     // Add more options as needed
//   ];

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

//   TextEditingController YearsOfInvestment = new TextEditingController();
//   TextEditingController minimum_investment = new TextEditingController();
//   TextEditingController minimum_profit = new TextEditingController();
//   TextEditingController riskAllowed = new TextEditingController();
//   TextEditingController Description = new TextEditingController();
//   TextEditingController AllowedTime = new TextEditingController();
//   double riskValue = 5.0;
//   String? selectedField;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Create Project',
//             style: TextStyle(
//               color: Colors.white,
//             )),
//         backgroundColor: Colors.black,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 20),
//               // Dropdown Button

//               DropdownButton<String>(
//                 hint: Text("Select Field"),
//                 value: selectedField,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedField = value;
//                   });
//                 },
//                 items: fieldsList.map((field) {
//                   return DropdownMenuItem<String>(
//                     value: field,
//                     child: Text(field),
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 20),
//               Text("Investment experience: $selectedExperience years"),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     if (selectedExperience > 1) {
//                       selectedExperience--;
//                     }
//                     YearsOfInvestment.text = selectedExperience.toString();
//                   });
//                 },
//                 child: Icon(Icons.remove),
//               ),
//               SizedBox(width: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     selectedExperience++;
//                     YearsOfInvestment.text = selectedExperience.toString();
//                   });
//                 },
//                 child: Icon(Icons.add),
//               ),
//               SizedBox(height: 20),
//               Text("Investment amount: \$${selectedInvestment * 1000}"),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     if (selectedInvestment > 1) {
//                       selectedInvestment--;
//                     }
//                     minimum_investment.text =
//                         (selectedInvestment * 1000).toString();
//                   });
//                 },
//                 child: Icon(Icons.remove),
//               ),
//               SizedBox(width: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     selectedInvestment++;
//                     minimum_investment.text =
//                         (selectedInvestment * 1000).toString();
//                   });
//                 },
//                 child: Icon(Icons.add),
//               ),
//               SizedBox(height: 20),
//               Text("Minimum Profit: \$${selectedMinimumProfit * 1000}"),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     if (selectedMinimumProfit > 1) {
//                       selectedMinimumProfit--;
//                     }
//                     minimum_profit.text =
//                         (selectedMinimumProfit * 1000).toString();
//                   });
//                 },
//                 child: Icon(Icons.remove),
//               ),
//               SizedBox(width: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     selectedMinimumProfit++;
//                     minimum_profit.text =
//                         (selectedMinimumProfit * 1000).toString();
//                   });
//                 },
//                 child: Icon(Icons.add),
//               ),
//               SizedBox(height: 20),
//               Text('Select Risk Level: $riskValue'),
//               Slider(
//                 value: riskValue,
//                 min: 1,
//                 max: 10,
//                 divisions: 9,
//                 onChanged: (value) {
//                   setState(() {
//                     riskValue = value;
//                     riskAllowed.text = value.toString();
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Use riskAllowed.text to send the value to the backend
//                   print('Selected Risk Level: $riskValue');
//                   print('Sending to backend: ${riskAllowed.text}');
//                   // Add your backend API call here using riskAllowed.text
//                 },
//                 child: Text('Submit'),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText:
//                       "Write some details or info about what kind of business or project you want to invest in and why?",
//                 ),
//                 controller: Description,
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText:
//                       "Write in terms of weeks or months you think you can wait for the project to complete and start generating money",
//                 ),
//                 controller: AllowedTime,
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   int id = int.parse(widget.enteredId);
//                   String minimum_investments = minimum_investment.text;
//                   String minimumprofits = minimum_profit.text;
//                   String Allowed_risks = riskAllowed.text;
//                   String descriptions = Description.text;
//                   String time_scales = AllowedTime.text;
//                   String YearsInvesting = YearsOfInvestment.text;

//                   List<User>? post = await RemoteService()
//                       .sendInvestorProjectProfile(
//                           id,
//                           selectedField.toString(),
//                           YearsInvesting,
//                           minimum_investments,
//                           minimumprofits,
//                           Allowed_risks,
//                           descriptions,
//                           time_scales);
//                   setState(() {
//                     _post = post;
//                   });

//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => afterThirdPartProfileCreation(
//                         enteredId: widget.enteredId,
//                         enteredEmail: widget.enteredEmail,
//                         enteredPassword: widget.enteredPassword,
//                         enteredUsername: widget.enteredUsername,
//                         enteredphoneNumber: widget.enteredphoneNumber,
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text('Click Me'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:api_demo/views/pallete.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/views/AfterProfileCreationInvestorEntrepreneur/afterThirdPartProfileCreation.dart';
import 'package:api_demo/views/ninthSecondAfterLoginPage.dart';

class makingInvestorProject extends StatefulWidget {
  final String enteredId;
  final String enteredUsername;
  final String enteredPassword;
  final String enteredEmail;
  final String enteredphoneNumber;

  makingInvestorProject({
    required this.enteredId,
    required this.enteredUsername,
    required this.enteredPassword,
    required this.enteredEmail,
    required this.enteredphoneNumber,
  });

  @override
  State<makingInvestorProject> createState() =>
      _thirdafterMakingInvestorState();
}

class _thirdafterMakingInvestorState extends State<makingInvestorProject> {
  List<User>? posts;
  var isLoaded = false;
  String selectedOption = '';
  List<User>? _post;
  int selectedInvestment = 1;
  int selectedExperience = 1;
  int selectedMinimumProfit = 1;
  // String selectedField = ''; // Added for dropdown

  List<String> fieldsList = [
    'Food',
    'Clothing',
    'Retail',
    'Finance', // Added
    'Software', // Added
    // Add more options as needed
  ];

  @override
  void initState() {
    super.initState();

    //fetch data from API
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

  TextEditingController YearsOfInvestment = new TextEditingController();
  TextEditingController minimum_investment = new TextEditingController();
  TextEditingController minimum_profit = new TextEditingController();
  TextEditingController riskAllowed = new TextEditingController();
  TextEditingController Description = new TextEditingController();
  TextEditingController AllowedTime = new TextEditingController();
  double riskValue = 5.0;
  String? selectedField;
  void showCongratulationsAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('Your project has been created.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog

                // Navigate to the next screen after the dialog is closed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ninthSecondAfterLoginPage(
                      enteredId: widget.enteredId,
                      enteredUsername: widget.enteredUsername,
                      enteredPassword: widget.enteredPassword,
                      enteredEmail: widget.enteredEmail,
                      enteredphoneNumber: widget.enteredphoneNumber,
                    ),
                  ),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Create Investor Project',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Pallete.backgroundColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ), // Set the color of the back button
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                // Dropdown Button
                DropdownButton<String>(
                  hint: Text(
                    "Select Field",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  value: selectedField,
                  onChanged: (value) {
                    setState(() {
                      selectedField = value;
                    });
                  },
                  items: fieldsList.map((field) {
                    return DropdownMenuItem<String>(
                      value: field,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          field,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  dropdownColor: Pallete.backgroundColor,
                  elevation: 4,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  isExpanded: true,
                ),

                SizedBox(height: 20),
                Text("Investment experience: $selectedExperience years",
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedExperience > 1) {
                            selectedExperience--;
                          }
                          YearsOfInvestment.text =
                              selectedExperience.toString();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey, // Change the button color
                      ),
                      child: Icon(Icons.remove),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedExperience++;
                          YearsOfInvestment.text =
                              selectedExperience.toString();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey, // Change the button color
                      ),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text("Investment amount: \$${selectedInvestment * 1000}",
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedInvestment > 1) {
                            selectedInvestment--;
                          }
                          minimum_investment.text =
                              (selectedInvestment * 1000).toString();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey, // Change the button color
                      ),
                      child: Icon(Icons.remove),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedInvestment++;
                          minimum_investment.text =
                              (selectedInvestment * 1000).toString();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey, // Change the button color
                      ),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text("Minimum Profit: \$${selectedMinimumProfit * 1000}",
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedMinimumProfit > 1) {
                            selectedMinimumProfit--;
                          }
                          minimum_profit.text =
                              (selectedMinimumProfit * 1000).toString();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey, // Change the button color
                      ),
                      child: Icon(Icons.remove),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedMinimumProfit++;
                          minimum_profit.text =
                              (selectedMinimumProfit * 1000).toString();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey, // Change the button color
                      ),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text('Select Risk Level: $riskValue',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                Slider(
                  value: riskValue,
                  min: 1,
                  max: 10,
                  divisions: 9,
                  onChanged: (value) {
                    setState(() {
                      riskValue = value;
                      riskAllowed.text = value.toString();
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Use riskAllowed.text to send the value to the backend
                    print('Selected Risk Level: $riskValue');
                    print('Sending to backend: ${riskAllowed.text}');
                    // Add your backend API call here using riskAllowed.text
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey, // Change the button color
                  ),
                  child: Text('Submit',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        "What kind of business or project you want to invest in and why?",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  controller: Description,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        "Weeks or months you think you can wait for the project to complete and start generating money",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  controller: AllowedTime,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    int id = int.parse(widget.enteredId);
                    String minimum_investments = minimum_investment.text;
                    String minimumprofits = minimum_profit.text;
                    String Allowed_risks = riskAllowed.text;
                    String descriptions = Description.text;
                    String time_scales = AllowedTime.text;
                    String YearsInvesting = YearsOfInvestment.text;

                    List<User>? post =
                        await RemoteService().sendInvestorProjectProfile(
                      id,
                      selectedField.toString(),
                      YearsInvesting,
                      minimum_investments,
                      minimumprofits,
                      Allowed_risks,
                      descriptions,
                      time_scales,
                    );
                    setState(() {
                      _post = post;
                      // showCongratulationsAlert();
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ninthSecondAfterLoginPage(
                            enteredId: widget.enteredId,
                            enteredUsername: widget.enteredUsername,
                            enteredPassword: widget.enteredPassword,
                            enteredEmail: widget.enteredEmail,
                            enteredphoneNumber: widget.enteredphoneNumber),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey, // Change the button color
                  ),
                  child: Text('Click Me',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
