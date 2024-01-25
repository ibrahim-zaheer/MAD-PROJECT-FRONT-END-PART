import 'package:api_demo/firebase_options.dart';
import 'package:api_demo/views/home_page.dart';
import 'package:api_demo/views/display_page.dart';
import 'package:api_demo/views/display_users.dart';
import 'package:api_demo/views/camera/imagepicker.dart';
// import 'package:api_demo/views/login.dart';
import 'package:api_demo/views/creating_profile.dart';

import 'package:api_demo/views/product_display.dart';
import 'package:api_demo/views/FifthDisplayingAllInvestors.dart';
import 'package:api_demo/views/SixthOptionsToChoseEitherInvestororEntrepreneur.dart';
import 'package:api_demo/views/EigthDeletingProperProfile.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/views/ninthOneLoginPageButUsedWhenProfileAlreadyCreated.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:api_demo/views/notification/notification_sending.dart';
import 'package:api_demo/views/notification/welcome_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:api_demo/views/chatApp/chat_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
//for flutter pay method
import 'package:api_demo/views/payment/payment_method.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

import 'package:api_demo/views/introduction/introduction.dart';
// import 'package:api_demo/views/deviceInfo/deviceInfo.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:api_demo/views/pdfDownloading/pdfDownloader.dart';

import 'package:api_demo/views/api/firebase_api.dart';
import 'package:api_demo/models/firebase_files.dart';
import 'package:api_demo/views/page/image_page.dart';
import 'package:api_demo/views/profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:api_demo/views/UsingStorage/fireStorage.dart';
// import 'package:api_demo/views/UsingStorage/imagePage.dart';

final navigatorkey = GlobalKey<NavigatorState>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FireBaseApi().initNotifications();
  await MobileAds.instance.initialize();
  await FirebaseInAppMessaging.instance;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:
            Color.fromARGB(255, 85, 80, 80), // Set background color here
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: const NavigationWrapper(),
      navigatorKey: navigatorkey,
      routes: {
        '/welcome_screen': (context) => const welcomePage(),
        '/payPage': (context) => const PayPage(),
      }, // Wrap the pages in a navigation wrapper
    );
  }
}

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({Key? key}) : super(key: key);

  @override
  _NavigationWrapperState createState() => _NavigationWrapperState();
}
// ... Your imports and main function ...

class _NavigationWrapperState extends State<NavigationWrapper> {
  late Future<List<FirebaseFile>> futureFiles;
  int _currentIndex = 0;
  final List<Widget> _pages = [
    TextCarouselWidget(),
    const Login(),
    const creatingProfile(),
    // ProfileScreen()
  ];
  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseApi.listAll('files/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My App'),
      // ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            gap: 8,
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.home, text: 'Welcome'),
              GButton(icon: Icons.person, text: 'Login'),
              GButton(icon: Icons.person, text: 'Sign Up'),
              // GButton(icon: Icons.person, text: 'Sign Up'),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/signin_balls.png',
    'assets/signin_balls.png',
    'assets/signin_balls.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List'),
      ),
      body: ListView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('Image ${index + 1}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImagePage(imagePath: imagePaths[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  final String imagePath;

  ImagePage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Page'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: FirebaseStorageService().downloadImage(imagePath),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error loading image: ${snapshot.error}');
            } else {
              final imageUrl = snapshot.data;

              return imageUrl != null
                  ? Image.asset(imageUrl)
                  : Text('Image not found');
            }
          },
        ),
      ),
    );
  }
}

class FirebaseStorageService {
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: 'gs://food-4cd22.appspot.com');

  Future<String> downloadImage(String imagePath) async {
    try {
      final Reference ref = _storage.ref().child(imagePath);
      final String url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Error downloading image: $e');
      return ''; // Return an empty string or handle the error accordingly
    }
  }
}
