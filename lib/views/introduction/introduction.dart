import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class TextCarouselWidget extends StatefulWidget {
  @override
  _TextCarouselWidgetState createState() => _TextCarouselWidgetState();
}

class _TextCarouselWidgetState extends State<TextCarouselWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> carouselTexts = [
    'Welcome to the Investify! Your Solution to economic freedom',
    '1: Become an Investor or Entrepreneur',
    '2: Create a project and display to find people you want',
    '3: Chat with person and decide everything with that person',
    '4: Sit and relax, and enjoy the financial life you will start',
    'Enjoy Investing',
  ];

  @override
  void initState() {
    super.initState();

    // Fetch data from API

    // For fetching test ad
    initBannerAd();
  }

  late BannerAd bannerAd;
  bool isAdLoaded = false;
  var adUnit = "ca-app-pub-3940256099942544/6300978111";
  initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: adUnit,
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          isAdLoaded = true;
        });
      }),
      request: const AdRequest(),
    );
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How to Earn with Investify'),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: carouselTexts.length,
            itemBuilder: (context, index, realIndex) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(2, 2),
                          blurRadius: 7,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            carouselTexts[index],
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
              height: 300,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 2),
              autoPlayCurve: Curves.easeInOutBack,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              initialPage: 2,
              pageSnapping: false,
              viewportFraction: 0.7,
              autoPlayInterval: Duration(seconds: 4),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
      bottomSheet: _buildBottomSheet(),
      bottomNavigationBar: isAdLoaded
          ? SizedBox(
              height: bannerAd.size.height.toDouble(),
              width: bannerAd.size.width.toDouble(),
              child: AdWidget(
                ad: bannerAd,
              ),
            )
          : const SizedBox(),
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Swipe ',
            style: TextStyle(color: Colors.white),
          ),
          Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          Text(
            ' to go back ',
            style: TextStyle(color: Colors.white),
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          Text(
            ' to go forward ',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '| Page ${_currentPage + 1} of ${carouselTexts.length}',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class TextCarouselWidget extends StatefulWidget {
//   @override
//   _TextCarouselWidgetState createState() => _TextCarouselWidgetState();
// }

// class _TextCarouselWidgetState extends State<TextCarouselWidget> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   final List<String> carouselTexts = [
//     'Welcome to the Investify! Your Solution to economic freedom',
//     '1: Become an Investor or Entrepreneur',
//     '2: Create a project and display to find people you want',
//     '3: Chat with person and decide everything with that person',
//     '4: Sit and relax, and enjoy the financial life you will start',
//     'Enjoy Investing',
//   ];
//   @override
//   void initState() {
//     super.initState();

//     //fetch data from API

//     // for fecthing test ad
//     initBannerAd();
//   }

//   late BannerAd bannerAd;
//   bool isAdLoaded = false;
//   var adUnit = "ca-app-pub-3940256099942544/6300978111";
//   initBannerAd() {
//     bannerAd = BannerAd(
//       size: AdSize.largeBanner,
//       adUnitId: adUnit,
//       listener: BannerAdListener(onAdLoaded: (ad) {
//         setState(() {
//           isAdLoaded = true;
//         });
//       }),
//       request: const AdRequest(),
//     );
//     bannerAd.load();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Text Carousel'),
//       ),
//       body: PageView.builder(
//         controller: _pageController,
//         itemCount: carouselTexts.length,
//         onPageChanged: (int page) {
//           setState(() {
//             _currentPage = page;
//           });
//         },
//         itemBuilder: (context, index) {
//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 carouselTexts[index],
//                 style: TextStyle(fontSize: 18.0),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           );
//         },
//       ),
//       bottomSheet: _buildBottomSheet(),
//       bottomNavigationBar: isAdLoaded
//           ? SizedBox(
//               height: bannerAd.size.height.toDouble(),
//               width: bannerAd.size.width.toDouble(),
//               child: AdWidget(
//                 ad: bannerAd,
//               ),
//             )
//           : const SizedBox(),
//     );
//   }

//   Widget _buildBottomSheet() {
//     return Container(
//       color: Colors.blue,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'Swipe ',
//             style: TextStyle(color: Colors.white),
//           ),
//           Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           Text(
//             ' to go back ',
//             style: TextStyle(color: Colors.white),
//           ),
//           Icon(
//             Icons.arrow_forward,
//             color: Colors.white,
//           ),
//           Text(
//             ' to go forward ',
//             style: TextStyle(color: Colors.white),
//           ),
//           Text(
//             '| Page ${_currentPage + 1} of ${carouselTexts.length}',
//             style: TextStyle(color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class CarasoulPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Introduction to Investify',
//                 style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.blue.shade600,
//                     fontWeight: FontWeight.w900,
//                     shadows: [
//                       Shadow(
//                           color: Colors.black38,
//                           blurRadius: 5,
//                           offset: Offset(2, 2))
//                     ]),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               CarouselSlider.builder(
//                   itemCount: 10,
//                   itemBuilder: (context, index, realIndex) {
//                     return Container(
//                       margin: EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.black54,
//                               offset: Offset(2, 2),
//                               blurRadius: 7,
//                               spreadRadius: 2)
//                         ],
//                       ),
//                       child: Center(
//                         child: Text(
//                           'Become an Investor or Entrepreneur',
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     );
//                   },
//                   options: CarouselOptions(
//                       onPageChanged: (index, reason) {
//                         print(index.toString());
//                         print(reason.toString());
//                       },
//                       height: 300,
//                       autoPlay: true,
//                       autoPlayAnimationDuration: Duration(seconds: 2),
//                       autoPlayCurve: Curves.easeInOutBack,
//                       enlargeCenterPage: true,
//                       enlargeStrategy: CenterPageEnlargeStrategy.height,
//                       initialPage: 2,
//                       pageSnapping: false,
//                       viewportFraction: .7,
//                       autoPlayInterval: Duration(seconds: 4))),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Hope you enjoyed it,Keep learning and happy coding',
//                 style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.blue.shade600,
//                     fontWeight: FontWeight.w900,
//                     shadows: [
//                       Shadow(
//                           color: Colors.black26,
//                           blurRadius: 5,
//                           offset: Offset(2, 2))
//                     ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
