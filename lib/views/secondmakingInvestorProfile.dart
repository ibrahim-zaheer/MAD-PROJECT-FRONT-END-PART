import 'package:flutter/material.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/views/thirdafterMakingEntreprenuer.dart';
import 'package:api_demo/views/thirdafterInvestor.dart';
// import 'package:api_demo/views/Stage/beforeThird/choiceToLoginorMakeAProject.dart';
import 'package:api_demo/views/Stage/beforeThird/choiceToLoginorGoToInvestor.dart';

class InvestorProfile extends StatefulWidget {
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
  InvestorProfile(
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
  State<InvestorProfile> createState() => _InvestorProfileState();
}

class _InvestorProfileState extends State<InvestorProfile> {
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
                  hintText: "Enter your Company name or write solo"),
              controller: company_name,
            ),
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
            ElevatedButton(
              onPressed: () {
                // Handle the button press with the selected city
                String enteredIndustry = industry_expertise.text;
                print('Selected Industry: $selectedIndustry');
                print('Entered Industry: $enteredIndustry');
              },
              child: Text('Click to confirm the field'),
            ),
            SizedBox(height: 20),
            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: "Enter Job Title here",
            //   ),
            //   controller: job_title,
            // ),
            // SizedBox(height: 20),
            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: "Enter Previous Venture here",
            //   ),
            //   controller: previous_venture,
            // ),
            SizedBox(height: 20),
            Text("Tell Us the experience in years"),
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

            // SizedBox(height: 20),
            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText:
            //         "What are your short-term and long-term investment goals?",
            //   ),
            //   controller: achievements,
            // ),
            SizedBox(height: 20),
            Text(
                "Write the main work of your company or the job that you will do"),
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
              child: Text('Click to confirm the skills'),
            ),
            SizedBox(height: 20),
            Text("Write the highest degree you attained"),
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
              child: Text('Click to confirm the degree'),
            ),
            SizedBox(height: 20),

            // SizedBox(height: 20),
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
            Text("Write the description of yourelf as a company or as solo"),
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
                  String JobTitle = "Investor";
                  // String PreviousVenture = previous_venture.text;
                  String PreviousVenture = "New to Industry";

                  String YearsOfExperience = years_of_experience.text;
                  String Achievements = "No Data";
                  String KeySkills = keyskills.text;
                  String highestEducation = highest_education_attained.text;
                  String ProfileImage = "No Image";
                  String Linkedln = "No Linkedln Profile";
                  String Twitter = "No Twitter Profile";
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
