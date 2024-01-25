import 'package:flutter/material.dart';

import 'package:api_demo/views/home_page.dart';
import 'package:api_demo/views/display_page.dart';
import 'package:api_demo/views/display_users.dart';
// import 'package:api_demo/views/login.dart';
import 'package:api_demo/views/creating_profile.dart';
// import 'package:api_demo/views/secondmakingEntrepreneurproposals.dart';
// import 'package:api_demo/views/secondmakingInvestorProfile.dart';
import 'package:api_demo/views/secondmakingInvestorProfile.dart';
import 'package:api_demo/views/secondmakingEntrepreneurproposals.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/properProfile.dart';
import 'package:api_demo/views/ninthOneLoginPageButUsedWhenProfileAlreadyCreated.dart';

class UpdatingProperProfile extends StatefulWidget {
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

  UpdatingProperProfile(
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
      required this.CNIC});
  @override
  State<UpdatingProperProfile> createState() => _UpdatingProperProfileState();
}

class _UpdatingProperProfileState extends State<UpdatingProperProfile> {
  List<User>? posts;
  ProperProfile? posts2;
  var isLoaded = false;
  String selectedOption = '';
  List<User>? _post;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    checkData();
  }

  getData() async {
    posts = await RemoteService().getUsers();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  checkData() async {
    posts2 =
        await RemoteService().GetEachProperProfile(int.parse(widget.enteredId));
    if (posts2 == null) {
      // Data doesn't exist, allow the user to post the profile
      setState(() {
        isLoaded = true;
        print(widget.enteredId);
      });
    } else {
      // Data already exists, show an alert message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Profile Already Exists"),
            content: Text("The profile already exists for this ID."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the alert dialog
                  // Optionally, you can prevent navigation here if needed
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  TextEditingController date_of_birth = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController country = new TextEditingController();
  TextEditingController postalCode = new TextEditingController();
  TextEditingController latest_job = new TextEditingController();
  TextEditingController salary_Income_allowance = new TextEditingController();
  TextEditingController is_married = new TextEditingController();
  TextEditingController cnic_number = new TextEditingController();

  List<String> maritalStatusOptions = ['married', 'not_married'];
  String selectedMaritalStatus = '';

  String? validateSalary(String value) {
    try {
      int.parse(value);
    } catch (e) {
      return 'Please enter a valid integer for salary.';
    }

    return null; // Validation passed
  }

  @override
  Widget build(BuildContext context) {
    String Oldname = widget.enteredUsername;
    String Oldemail = widget.enteredEmail;
    String OldPassword = widget.enteredPassword;
    String OldPhoneNumber = widget.enteredphoneNumber;
    String OldRole = widget.enteredRole;
    String OldBirth = widget.enteredDateOfBirth;
    String OldCity = widget.city;
    String OldCountry = widget.country;
    String OldPostalCode = widget.postalCode;
    String OldLatestJob = widget.latestJob;
    String OldSalary = widget.salary_income;
    String OldMarried = widget.IsMarried;
    String OldCNIC = widget.CNIC;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "$OldBirth",
                ),
                controller: date_of_birth,
                readOnly: true, // Set to true to prevent manual editing
                onTap: () async {
                  // Show date picker when the field is tapped
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  // Update the text field with the selected date
                  if (pickedDate != null && pickedDate != date_of_birth.text) {
                    date_of_birth.text =
                        pickedDate.toLocal().toString().split(' ')[0];
                  }
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "$OldCity",
                ),
                controller: city,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "$OldCountry",
                ),
                controller: country,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: OldPostalCode),
                controller: postalCode,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "$OldLatestJob",
                ),
                controller: latest_job,
              ),
              SizedBox(height: 20),
              // TextField(
              //   decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: "Enter salary/Income/Allowance here"),
              //   controller: salary_Income_allowance,
              // ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "$OldSalary",
                  errorText: validateSalary(salary_Income_allowance.text),
                ),
                controller: salary_Income_allowance,
                keyboardType: TextInputType.number, // Allow only numeric input
                // inputFormatters: <TextInputFormatter>[
                //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                // ],
              ),
              SizedBox(height: 20),
              Text(
                'Are You Married?:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    is_married.text = 'married';
                  });
                },
                child: Text('Yes'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    is_married.text = 'not_married';
                  });
                },
                child: Text('No'),
              ),
              SizedBox(height: 20),
              Text(
                'Selected Option: $selectedOption',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "$OldCNIC",
                ),
                controller: cnic_number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    int id = int.parse(widget.enteredId);
                    String name = widget.enteredUsername;
                    String email = widget.enteredEmail;
                    String password = widget.enteredPassword;
                    String phoneNumber = widget.enteredphoneNumber;
                    String role = widget.enteredRole;
                    String dOB = date_of_birth.text.isEmpty
                        ? OldBirth
                        : date_of_birth.text;
                    String City = city.text.isEmpty ? OldCity : city.text;
                    String Country =
                        country.text.isEmpty ? OldCountry : country.text;
                    String PostalCode = postalCode.text.isEmpty
                        ? OldPostalCode
                        : postalCode.text;
                    String LatestJob = latest_job.text.isEmpty
                        ? OldLatestJob
                        : latest_job.text;
                    String SalaryIncome = salary_Income_allowance.text.isEmpty
                        ? OldSalary
                        : salary_Income_allowance.text;
                    String ISMarried =
                        is_married.text.isEmpty ? OldMarried : is_married.text;
                    String Cnic =
                        cnic_number.text.isEmpty ? OldCNIC : cnic_number.text;

                    // DateTime created = DateTime.parse(createDate.text);
                    List<User>? post = await RemoteService()
                        .updatingProperProfile(
                            id,
                            name,
                            password,
                            email,
                            phoneNumber,
                            role,
                            dOB,
                            City,
                            Country,
                            PostalCode,
                            LatestJob,
                            SalaryIncome,
                            ISMarried,
                            Cnic);
                    setState(() {
                      _post = post;
                    });
                    if (role.toLowerCase() == 'investor') {
                      // Navigate to InvestorProfile widget
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    } else {
                      // Navigate to SecondMakingProposals widget
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    }
                  },
                  child: Text("Click on me"))
            ],
          ),
        ),
      ),
    );
  }
}
