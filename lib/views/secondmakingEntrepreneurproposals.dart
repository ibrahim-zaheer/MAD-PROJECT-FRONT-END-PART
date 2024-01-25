// import 'package:flutter/material.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:api_demo/models/user.dart';
// import 'package:api_demo/models/entrepreneurproperProfile.dart';
// import 'package:api_demo/views/thirdafterEntreprenuer.dart';

// class secondmakingproposals extends StatefulWidget {
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
//   secondmakingproposals(
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
//       required this.CNIC});
//   @override
//   State<secondmakingproposals> createState() => _secondmakingproposalsState();
// }

// class _secondmakingproposalsState extends State<secondmakingproposals> {
//   List<User>? posts;
//   EntrepreneurproperProfile? posts2;
//   var isLoaded = false;
//   String selectedOption = '';
//   List<User>? _post;

//   @override
//   void initState() {
//     super.initState();

//     //fetch data from API
//     // getData();
//     checkData();
//   }

//   getData() async {
//     posts = await RemoteService().getUsers();
//     if (posts != null) {
//       setState(() {
//         isLoaded = true;
//       });
//     }
//   }

//   checkData() async {
//     posts2 = await RemoteService()
//         .getProperEntrepreneurProfile(int.parse(widget.enteredId.toString()));
//     if (posts2 == null) {
//       // Data doesn't exist, allow the user to post the profile
//       setState(() {
//         isLoaded = true;
//         print(widget.enteredId);
//       });
//     } else {
//       // Data already exists, you might want to show a message to the user
//       // or navigate to a different screen
//       // For now, I'm just printing a message to the console
//       print("Profile already exists for this ID");
//     }
//   }

//   TextEditingController company_name = new TextEditingController();
//   TextEditingController industry_expertise = new TextEditingController();
//   TextEditingController job_title = new TextEditingController();
//   TextEditingController previous_venture = new TextEditingController();
//   TextEditingController years_of_experience = new TextEditingController();
//   TextEditingController achievements = new TextEditingController();
//   TextEditingController keyskills = new TextEditingController();
//   TextEditingController highest_education_attained =
//       new TextEditingController();
//   TextEditingController profile_image = new TextEditingController();
//   TextEditingController linkedin_profile = new TextEditingController();
//   TextEditingController twitter_profile = new TextEditingController();
//   TextEditingController bio = new TextEditingController();

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
//                   hintText: "Enter company Name here(if not write freelancer)"),
//               controller: company_name,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: "Enter industry_expertise here"),
//               controller: industry_expertise,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter Job Title here",
//               ),
//               controller: job_title,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter Previous Venture here",
//               ),
//               controller: previous_venture,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter Years of Experience here",
//               ),
//               controller: years_of_experience,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter Achievements here",
//               ),
//               controller: achievements,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter Key Skills here",
//               ),
//               controller: keyskills,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter Highest Education Attained here",
//               ),
//               controller: highest_education_attained,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter Profile Image URL here",
//               ),
//               controller: profile_image,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter LinkedIn Profile URL here",
//               ),
//               controller: linkedin_profile,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter Twitter Profile URL here",
//               ),
//               controller: twitter_profile,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter Bio here",
//               ),
//               controller: bio,
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   int id = int.parse(widget.enteredId);
//                   String CompanyName = company_name.text;
//                   String industryExpertise = industry_expertise.text;
//                   String JobTitle = job_title.text;
//                   String PreviousVenture = previous_venture.text;
//                   String YearsOfExperience = years_of_experience.text;
//                   String Achievements = achievements.text;
//                   String KeySkills = keyskills.text;
//                   String highestEducation = highest_education_attained.text;
//                   String ProfileImage = profile_image.text;
//                   String Linkedln = linkedin_profile.text;
//                   String Twitter = twitter_profile.text;
//                   String Bio = bio.text;
//                   // String Cnic = cnic_number.text;

//                   // DateTime created = DateTime.parse(createDate.text);
//                   List<User>? post = await RemoteService()
//                       .sendEntrepreneurProfile(
//                           id,
//                           CompanyName,
//                           industryExpertise,
//                           JobTitle,
//                           PreviousVenture,
//                           YearsOfExperience,
//                           Achievements,
//                           KeySkills,
//                           highestEducation,
//                           ProfileImage,
//                           Linkedln,
//                           Twitter,
//                           Bio);
//                   setState(() {
//                     _post = post;
//                   });
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => thirdafterMakingEntreprenuer(
//                         // Pass necessary parameters to the next screen if needed
//                         enteredId: widget.enteredId,
//                         enteredUsername: widget.enteredUsername,
//                         enteredPassword: widget.enteredPassword,
//                         enteredEmail: widget.enteredEmail,
//                         enteredphoneNumber: widget.enteredphoneNumber,
//                         enteredRole: widget.enteredRole,
//                         enteredDateOfBirth: widget.enteredDateOfBirth,
//                         city: widget.city,
//                         country: widget.country,
//                         postalCode: widget.postalCode,
//                         latestJob: widget.latestJob,
//                         salary_income: widget.salary_income,
//                         IsMarried: widget.IsMarried,
//                         CNIC: widget.CNIC,
//                         CompanyName: CompanyName,
//                         IndustryExpertise: industryExpertise,
//                         JobTitle: JobTitle,
//                         PreviousVenture: PreviousVenture,
//                         YearsOfExperience: YearsOfExperience,
//                         Achievements: Achievements,
//                         KeySkills: KeySkills,
//                         HighestEducation: highestEducation,
//                         ProfileImage: ProfileImage,
//                         Linkedln: Linkedln,
//                         Twitter: Twitter,
//                         Bio: Bio,
//                       ),
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

import 'package:flutter/material.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/entrepreneurproperProfile.dart';
// import 'package:api_demo/views/thirdafterEntreprenuer.dart';
// import 'package:api_demo/views/Stage/First/second/secondmakingInvestorProfile.dart';
import 'package:api_demo/views/thirdafterMakingEntreprenuer.dart';
import 'package:api_demo/views/Stage/beforeThird/choiceToLoginorMakeAProject.dart';

class secondmakingproposals extends StatefulWidget {
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
  secondmakingproposals(
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
  State<secondmakingproposals> createState() => _secondmakingproposalsState();
}

class _secondmakingproposalsState extends State<secondmakingproposals> {
  List<User>? posts;
  EntrepreneurproperProfile? posts2;
  var isLoaded = false;
  String selectedOption = '';
  List<User>? _post;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    // getData();
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
    posts2 = await RemoteService()
        .getProperEntrepreneurProfile(int.parse(widget.enteredId.toString()));
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

  TextEditingController company_name = new TextEditingController();
  TextEditingController industry_expertise = new TextEditingController();
  TextEditingController job_title = new TextEditingController();
  TextEditingController previous_venture = new TextEditingController();
  TextEditingController years_of_experience = new TextEditingController();
  TextEditingController achievements = new TextEditingController();
  TextEditingController keyskills = new TextEditingController();
  TextEditingController highest_education_attained =
      new TextEditingController();
  TextEditingController profile_image = new TextEditingController();
  TextEditingController linkedin_profile = new TextEditingController();
  TextEditingController twitter_profile = new TextEditingController();
  TextEditingController bio = new TextEditingController();
  String selectedIndustry = 'Finance';
  String selectedSkills = 'Excel';
  String selectedDegree = 'Bachelor of Science in Computer Science';
  int selectedExperience = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company/Working Details'),
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
                  hintText:
                      "Enter Company you are working for else write independent"),
              controller: company_name,
            ),
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
                  industry_expertise.text =
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
              controller: industry_expertise,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the button press with the selected city
                String enteredIndustry = industry_expertise.text;
                print('Selected Industry: $selectedIndustry');
                print('Entered Industry: $enteredIndustry');
              },
              child: Text('Click to confirm the field'),
            ),

            // SizedBox(height: 20),
            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: "Enter Previous Venture here",
            //   ),
            //   controller: previous_venture,
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedExperience > 1) {
                    selectedExperience--;
                  }
                  years_of_experience.text = selectedExperience.toString();
                });
              },
              child: Icon(Icons.remove),
            ),
            SizedBox(width: 20),
            DropdownButton<int>(
              value: selectedExperience,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (int? newValue) {
                setState(() {
                  selectedExperience = newValue!;
                  years_of_experience.text = selectedExperience.toString();
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
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedExperience++;
                  years_of_experience.text = selectedExperience.toString();
                });
              },
              child: Icon(Icons.add),
            ),

            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedSkills,
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
                  selectedSkills = newValue!;
                  keyskills.text =
                      newValue!; // Set the selected city to the controller
                });
              },
              items: <String>[
                'Excel',
                'Programming',
                'Web Development',
                'Mobile App Development',
                'Data Analysis',
                'Machine Learning',
                'Artificial Intelligence',
                'UI/UX Design',
                'Graphic Design',
                'Video Editing',
                'Project Management',
                'Leadership',
                'Communication',
                'Problem Solving',
                'Critical Thinking',
                'Time Management',
                'Teamwork',
                'Marketing',
                'Sales',
                'Customer Service',
                'Networking',
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
                hintText: 'Selected Main Skill',
              ),
              controller: keyskills,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the button press with the selected city
                String enteredSkills = keyskills.text;
                print('Selected Skills: $selectedSkills');
                print('Entered Skills: $enteredSkills');
              },
              child: Text('Click to confirm the field'),
            ),

            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedDegree,
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
                  selectedDegree = newValue!;
                  highest_education_attained.text =
                      newValue!; // Set the selected city to the controller
                });
              },
              items: <String>[
                'Matric',
                'FSC Pre Engineering',
                'FSC Pre Medical',
                'ICS',
                'ICOM',
                'High School Diploma',
                'Associate Degree in Information Technology',
                'Bachelor of Science in Computer Science',
                'Bachelor of Arts in Psychology',
                'Bachelor of Business Administration',
                'Master of Science in Data Science',
                'Master of Business Administration (MBA)',
                'Doctor of Medicine (MD)',
                'Doctor of Philosophy (Ph.D.) in Physics',
                'Juris Doctor (JD) in Law',
                'Bachelor of Fine Arts in Graphic Design',
                'Bachelor of Engineering in Mechanical Engineering',
                'Master of Arts in English Literature',
                'Master of Public Health (MPH)',
                'Bachelor of Science in Nursing (BSN)',
                'Bachelor of Architecture',
                'Bachelor of Music in Music Education',
                'Bachelor of Commerce (B.Com)',
                'Master of Social Work (MSW)',
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
                hintText: 'Select Highest Degree',
              ),
              controller: highest_education_attained,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the button press with the selected city
                String enteredDegree = highest_education_attained.text;
                print('Selected Degree: $selectedDegree');
                print('Entered Degree: $enteredDegree');
              },
              child: Text('Click to confirm the field'),
            ),
            SizedBox(height: 20),
            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: "Enter Profile Image URL here",
            //   ),
            //   controller: profile_image,
            // ),
            // SizedBox(height: 20),
            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: "Enter LinkedIn Profile URL here",
            //   ),
            //   controller: linkedin_profile,
            // ),
            // SizedBox(height: 20),
            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: "Enter Twitter Profile URL here",
            //   ),
            //   controller: twitter_profile,
            // ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Bio here",
              ),
              controller: bio,
            ),
            ElevatedButton(
                onPressed: () async {
                  int id = int.parse(widget.enteredId);
                  String CompanyName = company_name.text;
                  String industryExpertise = industry_expertise.text;
                  String JobTitle = "No Data";
                  String PreviousVenture = "No Data";
                  String YearsOfExperience = years_of_experience.text;
                  String Achievements = "No Data";
                  String KeySkills = keyskills.text;
                  String highestEducation = highest_education_attained.text;
                  String ProfileImage = "No Data";
                  String Linkedln = "No Data";
                  String Twitter = "No Data";
                  String Bio = bio.text;
                  // String Cnic = cnic_number.text;

                  // DateTime created = DateTime.parse(createDate.text);
                  List<User>? post = await RemoteService()
                      .sendEntrepreneurProfile(
                          id,
                          CompanyName,
                          industryExpertise,
                          JobTitle,
                          PreviousVenture,
                          YearsOfExperience,
                          Achievements,
                          KeySkills,
                          highestEducation,
                          ProfileImage,
                          Linkedln,
                          Twitter,
                          Bio);
                  setState(() {
                    _post = post;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Choice(
                        // Pass necessary parameters to the next screen if needed
                        enteredId: widget.enteredId,
                        enteredUsername: widget.enteredUsername,
                        enteredPassword: widget.enteredPassword,
                        enteredEmail: widget.enteredEmail,
                        enteredphoneNumber: widget.enteredphoneNumber,
                        enteredRole: widget.enteredRole,
                        enteredDateOfBirth: widget.enteredDateOfBirth,
                        city: widget.city,
                        country: widget.country,
                        postalCode: widget.postalCode,
                        latestJob: widget.latestJob,
                        salary_income: widget.salary_income,
                        IsMarried: widget.IsMarried,
                        CNIC: widget.CNIC,
                        CompanyName: CompanyName,
                        IndustryExpertise: industryExpertise,
                        JobTitle: JobTitle,
                        PreviousVenture: PreviousVenture,
                        YearsOfExperience: YearsOfExperience,
                        Achievements: Achievements,
                        KeySkills: KeySkills,
                        HighestEducation: highestEducation,
                        ProfileImage: ProfileImage,
                        Linkedln: Linkedln,
                        Twitter: Twitter,
                        Bio: Bio,
                      ),
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
