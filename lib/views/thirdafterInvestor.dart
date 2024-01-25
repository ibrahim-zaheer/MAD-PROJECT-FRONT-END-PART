import 'dart:ffi';

import 'package:api_demo/views/FourthafterInvestorProjectSuccess.dart';
import 'package:api_demo/views/AfterProfileCreationInvestorEntrepreneur/afterThirdPartProfileCreation.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/views/TenthHomePage.dart';

class thirdafterMakingInvestor extends StatefulWidget {
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

  thirdafterMakingInvestor(
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
  State<thirdafterMakingInvestor> createState() =>
      _thirdafterMakingInvestorState();
}

class _thirdafterMakingInvestorState extends State<thirdafterMakingInvestor> {
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

  // TextEditingController name = new TextEditingController();
  TextEditingController fieldOfInvestment = new TextEditingController();
  TextEditingController YearsOfInvestment = new TextEditingController();
  TextEditingController minimum_investment = new TextEditingController();
  TextEditingController minimum_profit = new TextEditingController();
  TextEditingController riskAllowed = new TextEditingController();
  TextEditingController Description = new TextEditingController();
  TextEditingController AllowedTime = new TextEditingController();
  String selectedIndustry = 'Automotive';
  String selectedSkills = 'Excel';
  String selectedDegree = 'Bachelor of Science in Computer Science';
  int selectedExperience = 1;
  int selectedExperiences = 0;
  int selectedInvestments = 1;
  int selectedRisk = 1;
  double riskValue = 5.0;
  String selectedAllowedTime = "Less than a week";
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
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedIndustry,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedIndustry = newValue!;
                  fieldOfInvestment.text =
                      newValue!; // Set the selected city to the controller
                });
              },
              items: <String>[
                'Information Technology',
                'Finance',
                'Healthcare',
                'Automotive',
                'Education',
                'Retail',
                'Telecommunications',
                'Hospitality',
                'Manufacturing',
                'Real Estate',
                'Agriculture',
                'Energy',
                'Entertainment',
                'Fashion',
                'Media',
                'Biotechnology',
                'Transportation',
                'Construction',
                'Pharmaceutical',
                'Environmental',
                // Add more countries as needed
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Selected Field',
              ),
              controller: fieldOfInvestment,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedExperience > 1) {
                    selectedExperience--;
                  }
                  YearsOfInvestment.text = selectedExperience.toString();
                });
              },
              child: Icon(Icons.remove),
            ),
            SizedBox(width: 20),
            Text("Years of the required business experience "),
            DropdownButton<int>(
              value: selectedExperience,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              onChanged: (int? newValue) {
                setState(() {
                  selectedExperience = newValue!;
                  YearsOfInvestment.text = selectedExperience.toString();
                });
              },
              items: List.generate(30, (index) => index + 1)
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text("${value.toString()}"),
                );
              }).toList(),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedExperience++;
                  YearsOfInvestment.text = selectedExperience.toString();
                });
              },
              child: Icon(Icons.add),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            SizedBox(width: 20),
            Text("minimum investment you can offer"),
            DropdownButton<int>(
              value: selectedExperience,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.red),
              onChanged: (int? newValue) {
                setState(() {
                  selectedExperience = newValue!;
                  minimum_investment.text =
                      (selectedExperience * 1000).toString();
                });
              },
              items: List.generate(30, (index) => index + 1)
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(" ${(value * 1000)}"),
                );
              }).toList(),
            ),
            SizedBox(width: 20),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text("Tell Us the risk you can tolerate"),
            SizedBox(width: 20),
            DropdownButton<int>(
              value: selectedExperience,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.red),
              onChanged: (int? newValue) {
                setState(() {
                  selectedExperience = newValue!;
                  riskAllowed.text = selectedRisk.toString();
                });
              },
              items: List.generate(30, (index) => index + 1)
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:
                    "write some details or info about what kind of business or project you want to invest in and why?",
              ),
              controller: Description,
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedAllowedTime,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.red),
              underline: Container(
                height: 2,
                color: Colors.grey,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedAllowedTime = newValue!;
                  AllowedTime.text =
                      newValue!; // Set the selected city to the controller
                });
              },
              items: <String>[
                "Less than a week",
                "At least 1 month",
                "At least 3 months",
                "At least 6 months",
                "At least 1 year",
                // Add more countries as needed
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Allowed Time',
              ),
              controller: AllowedTime,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  int id = int.parse(widget.enteredId);
                  // String names = name.text;
                  String fields = fieldOfInvestment.text;
                  String minimum_investments = minimum_investment.text;
                  String minimumprofits = minimum_profit.text;
                  String Allowed_risks = riskAllowed.text;
                  String descriptions = Description.text;
                  String time_scales = AllowedTime.text;
                  String YearsInvesting = YearsOfInvestment.text;
                  // String Cnic = cnic_number.text;
                  double allowingRisk = double.tryParse(Allowed_risks) ?? 0.0;

                  // DateTime created = DateTime.parse(createDate.text);
                  List<User>? post = await RemoteService()
                      .sendInvestorProjectProfile(
                          id,
                          fields,
                          YearsInvesting,
                          minimum_investments,
                          minimumprofits,
                          Allowed_risks,
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
