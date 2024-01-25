import 'package:flutter/material.dart';
import 'package:api_demo/views/home_page.dart';
import 'package:api_demo/views/display_page.dart';
import 'package:api_demo/views/display_users.dart';
// import 'package:api_demo/views/login.dart';
import 'package:api_demo/views/creating_profile.dart';
import 'package:api_demo/views/oneAfterSelectingRole.dart';
import 'package:api_demo/views/ninthOneLoginPageButUsedWhenProfileAlreadyCreated.dart';
import 'package:api_demo/views/ninthSecondAfterLoginPage.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/models/user.dart';
// import 'package:api_demo/views/ninthOneLoginPageButUsedWhenProfileAlreadyCreated.dart';

class updatingProfile extends StatefulWidget {
  final String enteredId;
  final String enteredUsername;
  final String enteredPassword;
  final String enteredEmail;
  final String enteredphoneNumber;
  updatingProfile(
      {required this.enteredId,
      required this.enteredUsername,
      required this.enteredPassword,
      required this.enteredEmail,
      required this.enteredphoneNumber});

  @override
  State<updatingProfile> createState() => _updatingProfileState();
}

class _updatingProfileState extends State<updatingProfile> {
  // List<String> deviceTokens = ["device_token_1", "device_token_2"];
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

  TextEditingController Namer = TextEditingController();
  TextEditingController Emailer = TextEditingController();
  TextEditingController Passworder = TextEditingController();
  TextEditingController PhoneNumberer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String Oldname = widget.enteredUsername;
    String Oldemail = widget.enteredEmail;
    String OldPassword = widget.enteredPassword;
    String OldPhoneNumber = widget.enteredphoneNumber;
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "$Oldname",
                    ),
                    controller: Namer,
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "$Oldemail",
                    ),
                    controller: Emailer,
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "$OldPassword",
                    ),
                    controller: Passworder,
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "$OldPhoneNumber",
                    ),
                    controller: PhoneNumberer,
                  ),
                ),
              ),
              Text(
                'Choose your role:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedOption = 'Investor';
                  });
                },
                child: Text('Investor'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedOption = 'Entrepreneur';
                  });
                },
                child: Text('Entrepreneur'),
              ),
              SizedBox(height: 20),
              Text(
                'Selected Option: $selectedOption',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    int id = int.parse(widget.enteredId);
                    String name = Namer.text.isNotEmpty
                        ? Namer.text
                        : widget.enteredUsername;
                    String email = Emailer.text.isNotEmpty
                        ? Emailer.text
                        : widget.enteredEmail;
                    String password = Passworder.text.isNotEmpty
                        ? Passworder.text
                        : widget.enteredPassword;
                    String phoneNumber = PhoneNumberer.text.isNotEmpty
                        ? PhoneNumberer.text
                        : widget.enteredphoneNumber;
                    String role = selectedOption;
                    RemoteService remoteService = RemoteService();
                    // DateTime created = DateTime.parse(createDate.text);
                    List<User>? post = await RemoteService()
                        .sendInvestorOrEntrepreneur(
                            id, name, password, email, phoneNumber, role);
                    await remoteService.sendPushNotification();
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
                  child: Text("Click on me"))
            ],
          ),
        ),
      ),
    );
  }
}
