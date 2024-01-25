import 'package:api_demo/views/FourthafterEntrepreneurProjectSuccess.dart';
import 'package:api_demo/views/TenthHomePage.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/main.dart';
import 'package:api_demo/views/AfterProfileCreationInvestorEntrepreneur/afterThirdPartProfileCreation.dart';
// import 'package:api_demo/views/thirdafterMakingEntreprenuer.dart';
import 'package:api_demo/views/thirdafterInvestor.dart';
import 'package:api_demo/views/ninthOneLoginPageButUsedWhenProfileAlreadyCreated.dart';
import 'package:api_demo/views/Investor/creatingInvestorProjects.dart';
import 'package:api_demo/views/entrepreneur/creatingEntrepreneurProjectAgain.dart';

class Choice extends StatefulWidget {
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

  Choice(
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
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  int id = int.parse(widget.enteredId);
                  String CompanyName = widget.CompanyName;
                  String industryExpertise = widget.IndustryExpertise;
                  String JobTitle = "No Data";
                  String PreviousVenture = "No Data";
                  String YearsOfExperience = widget.YearsOfExperience;
                  String Achievements = "No Data";
                  String KeySkills = widget.KeySkills;
                  String highestEducation = widget.HighestEducation;
                  String ProfileImage = "No Data";
                  String Linkedln = "No Data";
                  String Twitter = "No Data";
                  String Bio = widget.Bio;
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
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Text('Click Me To Back to Profile')),
            SizedBox(height: 20),
            Text(
              'Selected Option: $selectedOption',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //     onPressed: () async {
            //       int id = int.parse(widget.enteredId);
            //       String name = widget.enteredUsername;
            //       String email = widget.enteredEmail;
            //       String password = widget.enteredPassword;
            //       String phoneNumber = widget.enteredphoneNumber;
            //       String role = selectedOption;
            //       RemoteService remoteService = RemoteService();
            //       // DateTime created = DateTime.parse(createDate.text);
            //       List<User>? post = await RemoteService()
            //           .sendInvestorOrEntrepreneur(
            //               id, name, password, email, phoneNumber, role);
            //       await remoteService.sendPushNotification();
            //       setState(() {
            //         _post = post;
            //       });
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => oneAfterSelectingRole(
            //             // Pass necessary parameters to the next screen if needed
            //             enteredId: widget.enteredId,
            //             enteredUsername: widget.enteredUsername,
            //             enteredPassword: widget.enteredPassword,
            //             enteredEmail: widget.enteredEmail,
            //             enteredphoneNumber: widget.enteredphoneNumber,
            //             enteredRole: selectedOption,
            //           ),
            //         ),
            //       );
            //     },
            //     child: Text("Click on me"))
            ElevatedButton(
                onPressed: () async {
                  int id = int.parse(widget.enteredId);
                  String CompanyName = widget.CompanyName;
                  String industryExpertise = widget.IndustryExpertise;
                  String JobTitle = "No Data";
                  String PreviousVenture = "No Data";
                  String YearsOfExperience = widget.YearsOfExperience;
                  String Achievements = "No Data";
                  String KeySkills = widget.KeySkills;
                  String highestEducation = widget.HighestEducation;
                  String ProfileImage = "No Data";
                  String Linkedln = "No Data";
                  String Twitter = "No Data";
                  String Bio = widget.Bio;
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
                      builder: (context) => makingInvestorProject(
                        enteredId: id.toString(),
                        enteredUsername: widget.enteredUsername,
                        enteredEmail: widget.enteredEmail,
                        enteredPassword: widget.enteredPassword,
                        enteredphoneNumber: widget.enteredphoneNumber,
                      ),
                    ),
                    // MaterialPageRoute(
                    //   builder: (context) => thirdafterMakingInvestor(
                    //     // Pass necessary parameters to the next screen if needed
                    //     enteredId: widget.enteredId,
                    //     enteredUsername: widget.enteredUsername,
                    //     enteredPassword: widget.enteredPassword,
                    //     enteredEmail: widget.enteredEmail,
                    //     enteredphoneNumber: widget.enteredphoneNumber,
                    //     enteredRole: widget.enteredRole,
                    //     enteredDateOfBirth: widget.enteredDateOfBirth,
                    //     city: widget.city,
                    //     country: widget.country,
                    //     postalCode: widget.postalCode,
                    //     latestJob: widget.latestJob,
                    //     salary_income: widget.salary_income,
                    //     IsMarried: widget.IsMarried,
                    //     CNIC: widget.CNIC,
                    //     CompanyName: CompanyName,
                    //     IndustryExpertise: industryExpertise,
                    //     JobTitle: JobTitle,
                    //     PreviousVenture: PreviousVenture,
                    //     YearsOfExperience: YearsOfExperience,
                    //     Achievements: Achievements,
                    //     KeySkills: KeySkills,
                    //     HighestEducation: highestEducation,
                    //     ProfileImage: ProfileImage,
                    //     Linkedln: Linkedln,
                    //     Twitter: Twitter,
                    //     Bio: Bio,
                    //   ),
                    // ),
                  );
                },
                child: Text('Click Me To create the Project'))
          ],
        ),
      ),
    );
  }
}
