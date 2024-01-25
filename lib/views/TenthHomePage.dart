import 'package:api_demo/views/home_page.dart';
import 'package:api_demo/views/display_page.dart';
import 'package:api_demo/views/display_users.dart';
// import 'package:api_demo/views/login.dart';
import 'package:api_demo/views/creating_profile.dart';
import 'package:api_demo/views/product_display.dart';
import 'package:api_demo/views/FifthDisplayingAllInvestors.dart';
import 'package:api_demo/views/SixthOptionsToChoseEitherInvestororEntrepreneur.dart';
import 'package:api_demo/views/EigthDeletingProperProfile.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/views/ninthOneLoginPageButUsedWhenProfileAlreadyCreated.dart';

class TenthHomePage extends StatefulWidget {
  const TenthHomePage({Key? key}) : super(key: key);

  @override
  State<TenthHomePage> createState() => _TenthHomePageState();
}

class _TenthHomePageState extends State<TenthHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    // const HomePage(),
    const ProductPage(),
    const display_page(),
    const DisplayUsers(),
    const Login(),
    const creatingProfile(),
    const FifthDisplayingAllInvestors(),
    const SixthOptionsToChoseEitherInvestororEntrepreneur(),
    // const EightDeletingProperProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.red, // Set icon color when selected
        unselectedItemColor: Colors.blue, // Set icon color when unselected
        selectedLabelStyle:
            TextStyle(color: Colors.black), // Set label color when selected
        unselectedLabelStyle:
            TextStyle(color: Colors.black), // Set label color when unselected
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Text("display a page"),
              label: 'Display',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            label: 'Create a profile',
          ),
          BottomNavigationBarItem(
            icon: Text("displaying all investor profiles"),
            label: 'displaying all investor profile',
          ),
          BottomNavigationBarItem(
            icon: Text("Viewing the projects"),
            label: 'Viewing the projects',
          ),
          //this is the test version
          BottomNavigationBarItem(
            icon: Text("delete the profile"),
            label: 'delete the profile',
          ),
        ],
      ),
    );
  }
}
