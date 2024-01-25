import 'package:api_demo/views/pallete.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/views/AfterProfileCreationInvestorEntrepreneur/afterThirdPartProfileCreation.dart';
import 'package:api_demo/views/ninthSecondAfterLoginPage.dart';

class MakingEntreprenuerProject extends StatefulWidget {
  final String enteredId;
  final String enteredUsername;
  final String enteredPassword;
  final String enteredEmail;
  final String enteredphoneNumber;

  MakingEntreprenuerProject({
    required this.enteredId,
    required this.enteredUsername,
    required this.enteredPassword,
    required this.enteredEmail,
    required this.enteredphoneNumber,
  });

  @override
  State<MakingEntreprenuerProject> createState() =>
      _MakingEntreprenuerProjectState();
}

class _MakingEntreprenuerProjectState extends State<MakingEntreprenuerProject> {
  List<User>? posts;
  var isLoaded = false;
  String selectedOption = '';
  List<User>? _post;

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

  double riskValue = 5.0;
  TextEditingController name = TextEditingController();
  TextEditingController minimum_investment = TextEditingController();
  TextEditingController guaranteed_profit = TextEditingController();
  TextEditingController chance_of_risk = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController time_scale = TextEditingController();
  String? selectedField;

  List<String> fieldsList = [
    'Food',
    'Clothing',
    'Retail',
    'Finance',
    'Software',
    // Add more options as needed
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate back when the back button is pressed
        Navigator.of(context).pop();
        return false; // Return false to prevent the default behavior
      },
      child: Scaffold(
        backgroundColor: Pallete.backgroundColor,
        appBar: AppBar(
          title: Text('Create Entrepreneur Project',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Pallete.backgroundColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                // Dropdown Button
                DropdownButton<String>(
                  hint: Text("Select Field",
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
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
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name of the Project or Business",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  controller: name,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                SizedBox(height: 20),
                Text("Minimum Investment: \$${minimum_investment.text}",
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          int currentValue = int.parse(
                              minimum_investment.text.isEmpty
                                  ? '0'
                                  : minimum_investment.text);
                          currentValue = currentValue - 1000;
                          minimum_investment.text =
                              currentValue < 0 ? '0' : currentValue.toString();
                        });
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                      child: Icon(Icons.remove),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          int currentValue = int.parse(
                              minimum_investment.text.isEmpty
                                  ? '0'
                                  : minimum_investment.text);
                          currentValue = currentValue + 1000;
                          minimum_investment.text = currentValue.toString();
                        });
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text("Guaranteed Profit: \$${guaranteed_profit.text}",
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          int currentValue = int.parse(
                              guaranteed_profit.text.isEmpty
                                  ? '0'
                                  : guaranteed_profit.text);
                          currentValue = currentValue - 1000;
                          guaranteed_profit.text =
                              currentValue < 0 ? '0' : currentValue.toString();
                        });
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                      child: Icon(Icons.remove),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          int currentValue = int.parse(
                              guaranteed_profit.text.isEmpty
                                  ? '0'
                                  : guaranteed_profit.text);
                          currentValue = currentValue + 1000;
                          guaranteed_profit.text = currentValue.toString();
                        });
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
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
                      chance_of_risk.text = value.toString();
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Use chance_of_risk.text to send the value to the backend
                    print('Selected Risk Level: $riskValue');
                    print('Sending to backend: ${chance_of_risk.text}');
                    // Add your backend API call here using chance_of_risk.text
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                  child: Text('Submit',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Write some details or info about the project",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  controller: description,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        "Write in terms of week or month, you think the project will take to complete and start generating money",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  controller: time_scale,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                ElevatedButton(
                  onPressed: () async {
                    int id = int.parse(widget.enteredId);
                    String names = name.text;
                    String minimum_investments = minimum_investment.text;
                    String guaranteed_profits = guaranteed_profit.text;
                    String chance_of_risks = chance_of_risk.text;
                    String descriptions = description.text;
                    String time_scales = time_scale.text;

                    List<User>? post =
                        await RemoteService().sendEntrepreneurProjectProfile(
                      id,
                      names,
                      selectedField.toString(),
                      minimum_investments,
                      guaranteed_profits,
                      chance_of_risks,
                      descriptions,
                      time_scales,
                    );
                    setState(() {
                      _post = post;
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
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
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





















// import 'package:api_demo/views/FourthafterEntrepreneurProjectSuccess.dart';
// import 'package:api_demo/views/TenthHomePage.dart';
// import 'package:flutter/material.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/main.dart';
// import 'package:api_demo/views/AfterProfileCreationInvestorEntrepreneur/afterThirdPartProfileCreation.dart';
// // for range
// import 'package:syncfusion_flutter_sliders/sliders.dart';

// class MakingEntreprenuerProject extends StatefulWidget {
//   final String enteredId;
//   //  final String enteredId;
//   final String enteredUsername;
//   final String enteredPassword;
//   final String enteredEmail;
//   final String enteredphoneNumber;

//   MakingEntreprenuerProject({
//     required this.enteredId,
//     required this.enteredUsername,
//     required this.enteredPassword,
//     required this.enteredEmail,
//     required this.enteredphoneNumber,
//   });

//   @override
//   State<MakingEntreprenuerProject> createState() =>
//       _MakingEntreprenuerProjectState();
// }

// class _MakingEntreprenuerProjectState extends State<MakingEntreprenuerProject> {
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

//   double riskValue = 5.0;
//   TextEditingController name = new TextEditingController();
//   TextEditingController field = new TextEditingController();
//   TextEditingController minimum_investment = new TextEditingController();
//   TextEditingController guaranteed_profit = new TextEditingController();
//   TextEditingController chance_of_risk = new TextEditingController();
//   TextEditingController description = new TextEditingController();
//   TextEditingController time_scale = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         // Navigate back when the back button is pressed
//         Navigator.of(context).pop();
//         return false; // Return false to prevent the default behavior
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('User Details'),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: "Name of the Project or Business"),
//                 controller: name,
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText:
//                         "field or type of the business like for a food stall write 'food'"),
//                 controller: field,
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText:
//                       "Minimum Investment or money you need to start your business or the project",
//                 ),
//                 controller: minimum_investment,
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: "guaranteed profit",
//                 ),
//                 controller: guaranteed_profit,
//               ),
//               SizedBox(height: 20),
//               // TextField(
//               //   decoration: InputDecoration(
//               //     border: OutlineInputBorder(),
//               //     hintText:
//               //         "chance of risk or tell in 1 to 10 that you are uncertain of its success",
//               //   ),
//               //   controller: chance_of_risk,
//               Text('Select Risk Level: $riskValue'),
//               Slider(
//                 value: riskValue,
//                 min: 1,
//                 max: 10,
//                 divisions: 9,
//                 onChanged: (value) {
//                   setState(() {
//                     riskValue = value;
//                     chance_of_risk.text = value.toString();
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Use chanceOfRiskController.text to send the value to the backend
//                   print('Selected Risk Level: $riskValue');
//                   print('Sending to backend: ${chance_of_risk.text}');
//                   // Add your backend API call here using chanceOfRiskController.text
//                 },
//                 child: Text('Submit'),
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: "write some details or info about the project",
//                 ),
//                 controller: description,
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText:
//                       "write in terms of week or month, you think project will take to complete to start generating money",
//                 ),
//                 controller: time_scale,
//               ),
//               ElevatedButton(
//                   onPressed: () async {
//                     int id = int.parse(widget.enteredId);
//                     String names = name.text;
//                     String fields = field.text;
//                     String minimum_investments = minimum_investment.text;
//                     String guaranteed_profits = guaranteed_profit.text;
//                     String chance_of_risks = chance_of_risk.text;
//                     String descriptions = description.text;
//                     String time_scales = time_scale.text;
//                     // String Cnic = cnic_number.text;

//                     // DateTime created = DateTime.parse(createDate.text);
//                     List<User>? post = await RemoteService()
//                         .sendEntrepreneurProjectProfile(
//                             id,
//                             names,
//                             fields,
//                             minimum_investments,
//                             guaranteed_profits,
//                             chance_of_risks,
//                             descriptions,
//                             time_scales);
//                     setState(() {
//                       _post = post;
//                     });

//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => afterThirdPartProfileCreation(
//                           enteredId: widget.enteredId,
//                           enteredEmail: widget.enteredEmail,
//                           enteredPassword: widget.enteredPassword,
//                           enteredUsername: widget.enteredUsername,
//                           enteredphoneNumber: widget.enteredphoneNumber,
//                         ),
//                       ),
//                     );
//                   },
//                   child: Text('Click Me'))
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
