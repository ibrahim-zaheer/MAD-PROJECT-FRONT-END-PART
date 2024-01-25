import 'package:api_demo/views/FourthafterEntrepreneurProjectSuccess.dart';
import 'package:api_demo/views/TenthHomePage.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/main.dart';
import 'package:api_demo/views/AfterProfileCreationInvestorEntrepreneur/afterThirdPartProfileCreation.dart';

class thirdafterMakingEntreprenuer extends StatefulWidget {
  final String enteredId;
  final String enteredUsername;
  final String enteredPassword;
  final String enteredEmail;
  final String enteredphoneNumber;
  final String enteredRole;
  final String enteredDateOfBirth;
  final String city;
  final String country;
  final String postalCode;
  final String latestJob;
  final String salary_income;
  final String IsMarried;
  final String CNIC;
  final String CompanyName;
  final String IndustryExpertise;
  final String JobTitle;
  final String PreviousVenture;
  final String YearsOfExperience;
  final String Achievements;
  final String KeySkills;
  final String HighestEducation;
  final String ProfileImage;
  final String Linkedln;
  final String Twitter;
  final String Bio;

  thirdafterMakingEntreprenuer(
      {required this.enteredId,
      required this.enteredUsername,
      required this.enteredPassword,
      required this.enteredEmail,
      required this.enteredphoneNumber,
      required this.enteredRole,
      required this.enteredDateOfBirth,
      required this.city,
      required this.country,
      required this.postalCode,
      required this.latestJob,
      required this.salary_income,
      required this.IsMarried,
      required this.CNIC,
      required this.CompanyName,
      required this.IndustryExpertise,
      required this.JobTitle,
      required this.PreviousVenture,
      required this.YearsOfExperience,
      required this.Achievements,
      required this.KeySkills,
      required this.HighestEducation,
      required this.ProfileImage,
      required this.Linkedln,
      required this.Twitter,
      required this.Bio});

  @override
  State<thirdafterMakingEntreprenuer> createState() =>
      _thirdafterMakingEntreprenuerState();
}

class _thirdafterMakingEntreprenuerState
    extends State<thirdafterMakingEntreprenuer> {
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

  TextEditingController name = new TextEditingController();
  TextEditingController field = new TextEditingController();
  TextEditingController minimum_investment = new TextEditingController();
  TextEditingController guaranteed_profit = new TextEditingController();
  TextEditingController chance_of_risk = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController time_scale = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name of the Project or Business"),
              controller: name,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      "field or type of the business like for a food stall write 'food'"),
              controller: field,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:
                    "Minimum Investment or money you need to start your business or the project",
              ),
              controller: minimum_investment,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "guaranteed profit",
              ),
              controller: guaranteed_profit,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:
                    "chance of risk or tell in 1 to 10 that you are uncertain of its success",
              ),
              controller: chance_of_risk,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "write some details or info about the project",
              ),
              controller: description,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:
                    "write in terms of week or month, you think project will take to complete to start generating money",
              ),
              controller: time_scale,
            ),
            ElevatedButton(
                onPressed: () async {
                  int id = int.parse(widget.enteredId);
                  String names = name.text;
                  String fields = field.text;
                  String minimum_investments = minimum_investment.text;
                  String guaranteed_profits = guaranteed_profit.text;
                  String chance_of_risks = chance_of_risk.text;
                  String descriptions = description.text;
                  String time_scales = time_scale.text;
                  // String Cnic = cnic_number.text;

                  // DateTime created = DateTime.parse(createDate.text);
                  List<User>? post = await RemoteService()
                      .sendEntrepreneurProjectProfile(
                          id,
                          names,
                          fields,
                          minimum_investments,
                          guaranteed_profits,
                          chance_of_risks,
                          descriptions,
                          time_scales);
                  setState(() {
                    _post = post;
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => afterThirdPartProfileCreation(
                        enteredId: widget.enteredId,
                        enteredEmail: widget.enteredEmail,
                        enteredPassword: widget.enteredPassword,
                        enteredUsername: widget.enteredUsername,
                        enteredphoneNumber: widget.enteredphoneNumber,
                      ), // Navigate to TenthHomePage.dart
                    ),
                  );
                },
                child: Text('Click Me'))
          ]),
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

// class thirdafterMakingEntreprenuer extends StatefulWidget {
//   final String enteredId;
//   final String enteredUsername;
//   final String enteredPassword;
//   final String enteredEmail;
//   final String enteredphoneNumber;
//   final String enteredRole;
//   final String enteredDateOfBirth;
//   final String city;
//   final String country;
//   final String postalCode;
//   final String latestJob;
//   final String salary_income;
//   final String IsMarried;
//   final String CNIC;
//   final String CompanyName;
//   final String IndustryExpertise;
//   final String JobTitle;
//   final String PreviousVenture;
//   final String YearsOfExperience;
//   final String Achievements;
//   final String KeySkills;
//   final String HighestEducation;
//   final String ProfileImage;
//   final String Linkedln;
//   final String Twitter;
//   final String Bio;

//   thirdafterMakingEntreprenuer(
//       {required this.enteredId,
//       required this.enteredUsername,
//       required this.enteredPassword,
//       required this.enteredEmail,
//       required this.enteredphoneNumber,
//       required this.enteredRole,
//       required this.enteredDateOfBirth,
//       required this.city,
//       required this.country,
//       required this.postalCode,
//       required this.latestJob,
//       required this.salary_income,
//       required this.IsMarried,
//       required this.CNIC,
//       required this.CompanyName,
//       required this.IndustryExpertise,
//       required this.JobTitle,
//       required this.PreviousVenture,
//       required this.YearsOfExperience,
//       required this.Achievements,
//       required this.KeySkills,
//       required this.HighestEducation,
//       required this.ProfileImage,
//       required this.Linkedln,
//       required this.Twitter,
//       required this.Bio});

//   @override
//   State<thirdafterMakingEntreprenuer> createState() =>
//       _thirdafterMakingEntreprenuerState();
// }

// class _thirdafterMakingEntreprenuerState
//     extends State<thirdafterMakingEntreprenuer> {
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

//   TextEditingController name = new TextEditingController();
//   TextEditingController field = new TextEditingController();
//   TextEditingController minimum_investment = new TextEditingController();
//   TextEditingController guaranteed_profit = new TextEditingController();
//   TextEditingController chance_of_risk = new TextEditingController();
//   TextEditingController description = new TextEditingController();
//   TextEditingController time_scale = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Details'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: "Name of the Project or Business"),
//               controller: name,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText:
//                       "field or type of the business like for a food stall write 'food'"),
//               controller: field,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText:
//                     "Minimum Investment or money you need to start your business or the project",
//               ),
//               controller: minimum_investment,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "guaranteed profit",
//               ),
//               controller: guaranteed_profit,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText:
//                     "chance of risk or tell in 1 to 10 that you are uncertain of its success",
//               ),
//               controller: chance_of_risk,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "write some details or info about the project",
//               ),
//               controller: description,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText:
//                     "write in terms of week or month, you think project will take to complete to start generating money",
//               ),
//               controller: time_scale,
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   int id = int.parse(widget.enteredId);
//                   String names = name.text;
//                   String fields = field.text;
//                   String minimum_investments = minimum_investment.text;
//                   String guaranteed_profits = guaranteed_profit.text;
//                   String chance_of_risks = chance_of_risk.text;
//                   String descriptions = description.text;
//                   String time_scales = time_scale.text;
//                   // String Cnic = cnic_number.text;

//                   // DateTime created = DateTime.parse(createDate.text);
//                   List<User>? post = await RemoteService()
//                       .sendEntrepreneurProjectProfile(
//                           id,
//                           names,
//                           fields,
//                           minimum_investments,
//                           guaranteed_profits,
//                           chance_of_risks,
//                           descriptions,
//                           time_scales);
//                   setState(() {
//                     _post = post;
//                   });
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) =>
//                   //         FourthadterEntrepreneurProjectSuccess(
//                   //       // Pass necessary parameters to the next screen if needed
//                   //       enteredId: widget.enteredId,
//                   //       enteredUsername: widget.enteredUsername,
//                   //       enteredPassword: widget.enteredPassword,
//                   //       enteredEmail: widget.enteredEmail,
//                   //       enteredphoneNumber: widget.enteredphoneNumber,
//                   //       enteredRole: widget.enteredRole,
//                   //       enteredDateOfBirth: widget.enteredDateOfBirth,
//                   //       city: widget.city,
//                   //       country: widget.country,
//                   //       postalCode: widget.postalCode,
//                   //       latestJob: widget.latestJob,
//                   //       salary_income: widget.salary_income,
//                   //       IsMarried: widget.IsMarried,
//                   //       CNIC: widget.CNIC,
//                   //       CompanyName: widget.CompanyName,
//                   //       IndustryExpertise: widget.IndustryExpertise,
//                   //       JobTitle: widget.JobTitle,
//                   //       PreviousVenture: widget.PreviousVenture,
//                   //       YearsOfExperience: widget.YearsOfExperience,
//                   //       Achievements: widget.Achievements,
//                   //       KeySkills: widget.KeySkills,
//                   //       HighestEducation: widget.HighestEducation,
//                   //       ProfileImage: widget.ProfileImage,
//                   //       Linkedln: widget.Linkedln,
//                   //       Twitter: widget.Twitter,
//                   //       Bio: widget.Bio,
//                   //     ),
//                   //   ),
//                   // );
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           TenthHomePage(), // Navigate to TenthHomePage.dart
//                     ),
//                   );
//                 },
//                 child: Text('Click Me'))
//           ]),
//         ),
//       ),
//     );
//   }
// }
