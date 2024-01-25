import 'package:flutter/material.dart';

import 'package:api_demo/views/home_page.dart';
import 'package:api_demo/views/display_page.dart';
import 'package:api_demo/views/display_users.dart';
import 'package:api_demo/views/login.dart';
import 'package:api_demo/views/creating_profile.dart';
import 'package:api_demo/views/secondmakingInvestorProfile.dart';
import 'package:api_demo/views/secondmakingEntrepreneurproposals.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/properProfile.dart';

class oneAfterSelectingRole extends StatefulWidget {
  final String enteredId;
  final String enteredUsername;
  final String enteredPassword;
  final String enteredEmail;
  final String enteredphoneNumber;
  final String enteredRole;
  oneAfterSelectingRole(
      {required this.enteredId,
      required this.enteredUsername,
      required this.enteredPassword,
      required this.enteredEmail,
      required this.enteredphoneNumber,
      required this.enteredRole});
  @override
  State<oneAfterSelectingRole> createState() => _oneAfterSelectingRoleState();
}

class _oneAfterSelectingRoleState extends State<oneAfterSelectingRole> {
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
  String selectedCity = "Sialkot";
  List<String> maritalStatusOptions = ['married', 'not_married'];
  String selectedMaritalStatus = '';
  String selectedCountry = "Pakistan";
  String selectedJob = "BusinessMan";

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
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter date_of_birth here",
                ),
                controller: date_of_birth,
                readOnly: true, // Set to true to prevent manual editing
                onTap: () async {
                  // Show date picker when the field is tapped
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());

                  // Update the text field with the selected date
                  if (pickedDate != null && pickedDate != date_of_birth.text) {
                    date_of_birth.text =
                        pickedDate.toLocal().toString().split(' ')[0];
                  }
                },
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedCity,
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
                    selectedCity = newValue!;
                    city.text =
                        newValue!; // Set the selected city to the controller
                  });
                },
                items: <String>[
                  'Sialkot',
                  'Lahore',
                  'Peshawar',
                  'Karachi',
                  'Islamabad',
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
                  hintText: 'Selected City',
                ),
                controller: city,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle the button press with the selected city
                  String enteredCity = city.text;
                  print('Selected City: $selectedCity');
                  print('Entered City: $enteredCity');
                },
                child: Text('Click to confirm the city'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                  onPrimary: Colors.white, // Text color
                ),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedCountry,
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
                    selectedCountry = newValue!;
                    country.text =
                        newValue!; // Set the selected city to the controller
                  });
                },
                items: <String>[
                  "Pakistan",
                  "Pakistans",
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Selected Country',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                controller: country,
                style: TextStyle(color: Colors.orange),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle the button press with the selected city
                  String enteredCity = city.text;
                  print('Selected City: $selectedCountry');
                  print('Entered City: $enteredCity');
                },
                child: Text('Click to confirm the country'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                  onPrimary: Colors.white, // Text color
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter postalCode here"),
                controller: postalCode,
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedJob,
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
                    selectedJob = newValue!;
                    latest_job.text =
                        newValue!; // Set the selected city to the controller
                  });
                },
                items: <String>[
                  'no Job',
                  'Software Engineer',
                  'Data Scientist',
                  'Graphic Designer',
                  'Mechanical Engineer',
                  'Accountant',
                  'Teacher',
                  'Doctor',
                  'Chef',
                  'Sales Manager',
                  'Marketing Specialist',
                  'Electrician',
                  'Web Developer',
                  'BusinessMan',
                  'Nurse',
                  'Police Officer',
                  'Architect',
                  'Writer',
                  'Financial Analyst',
                  'Human Resources Manager',
                  'Mechanic',
                  'Photographer',
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
                  hintText: 'Selected Job',
                ),
                controller: latest_job,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle the button press with the selected city
                  String enteredJob = latest_job.text;
                  print('Selected City: $selectedJob');
                  print('Entered City: $enteredJob');
                },
                child: Text('Click to confirm your job'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                  onPrimary: Colors.white, // Text color
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter salary/Income/Allowance here",
                  errorText: validateSalary(salary_Income_allowance.text),
                ),
                controller: salary_Income_allowance,
                keyboardType: TextInputType.number,
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
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Background color
                  onPrimary: Colors.white, // Text color
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    is_married.text = 'not_married';
                  });
                },
                child: Text('No'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink, // Background color
                  onPrimary: Colors.white, // Text color
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Selected Option: ${is_married.text}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter cnic number here"),
                controller: cnic_number,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    cnic_number.text = '${cnic_number.text}';
                  });
                },
                child: Text('click'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Background color
                  onPrimary: Colors.white, // Text color
                ),
              ),
              SizedBox(height: 20),
              Text(
                'CNIC Number: ${cnic_number.text}',
                style: TextStyle(fontSize: 16),
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
                  String dOB = date_of_birth.text;
                  String City = city.text;
                  String Country = country.text;
                  String PostalCode = postalCode.text;
                  String LatestJob = latest_job.text;
                  String SalaryIncome = salary_Income_allowance.text;
                  String ISMarried = is_married.text;
                  String Cnic = cnic_number.text;
                  String Year = dOB.substring(0, 4);
                  int value = int.parse(Year);

                  if ((2024 - value) > 18) {
                    // DateTime created = DateTime.parse(createDate.text);
                    List<User>? post = await RemoteService().sendProperProfile(
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
                          builder: (context) => InvestorProfile(
                            // Pass necessary parameters to the next screen if needed
                            enteredId: widget.enteredId,
                            enteredUsername: widget.enteredUsername,
                            enteredPassword: widget.enteredPassword,
                            enteredEmail: widget.enteredEmail,
                            enteredphoneNumber: widget.enteredphoneNumber,
                            enteredRole: role,
                            enteredDateOfBirth: dOB,
                            city: City,
                            country: Country,
                            postalCode: PostalCode,
                            latestJob: LatestJob,
                            salary_income: SalaryIncome,
                            IsMarried: ISMarried,
                            CNIC: Cnic,
                          ),
                        ),
                      );
                    } else {
                      // Navigate to SecondMakingProposals widget
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => secondmakingproposals(
                            // Pass necessary parameters to the next screen if needed
                            enteredId: widget.enteredId,
                            enteredUsername: widget.enteredUsername,
                            enteredPassword: widget.enteredPassword,
                            enteredEmail: widget.enteredEmail,
                            enteredphoneNumber: widget.enteredphoneNumber,
                            enteredRole: role,
                            enteredDateOfBirth: dOB,
                            city: City,
                            country: Country,
                            postalCode: PostalCode,
                            latestJob: LatestJob,
                            salary_income: SalaryIncome,
                            IsMarried: ISMarried,
                            CNIC: Cnic,
                          ),
                        ),
                      );
                    }
                  } else {
                    if (Cnic.length < 13) {
                      // Email is not valid, show an error message or handle it as needed
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Invalid CNIC"),
                            content: Text("Must valid CNIC to make an account"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else if ((2024 - value) < 18) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Invalid Age"),
                            content: Text("Please enter a valid Age"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                child: Text("Click on me"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                  onPrimary: Colors.white, // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
