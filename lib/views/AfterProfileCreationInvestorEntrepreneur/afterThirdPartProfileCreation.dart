// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';
// import 'package:api_demo/views/SixthOptionsToChoseEitherInvestororEntrepreneur.dart';
// import 'package:api_demo/views/TenthHomePage.dart';
// import 'package:flutter/material.dart';
// import 'package:api_demo/services/remote_service.dart';
// import 'package:api_demo/views/ninthOneLoginPageButUsedWhenProfileAlreadyCreated.dart';
// import 'package:api_demo/views/ninthSecondAfterLoginPage.dart';

// class afterThirdPartProfileCreation extends StatefulWidget {
//   final String enteredId;
//   final String enteredUsername;
//   final String enteredPassword;
//   final String enteredEmail;
//   final String enteredphoneNumber;
//   const afterThirdPartProfileCreation({
//     required this.enteredId,
//     required this.enteredUsername,
//     required this.enteredPassword,
//     required this.enteredEmail,
//     required this.enteredphoneNumber,
//   });

//   @override
//   State<afterThirdPartProfileCreation> createState() =>
//       _afterThirdPartProfileCreationState();
// }

// class _afterThirdPartProfileCreationState
//     extends State<afterThirdPartProfileCreation> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Choose Either'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         SixthOptionsToChoseEitherInvestororEntrepreneur(),
//                   ),
//                 );
//               },
//               child: Text('Want to view all the investors or entrepreneurs'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ninthSecondAfterLoginPage(
//                         enteredId: widget.enteredId,
//                         enteredUsername: widget.enteredUsername,
//                         enteredPassword: widget.enteredPassword,
//                         enteredEmail: widget.enteredEmail,
//                         enteredphoneNumber: widget.enteredphoneNumber),
//                   ),
//                 );
//               },
//               child: Text('Go to Home Page'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:api_demo/views/SixthOptionsToChoseEitherInvestororEntrepreneur.dart';
import 'package:api_demo/views/TenthHomePage.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/views/ninthOneLoginPageButUsedWhenProfileAlreadyCreated.dart';
import 'package:api_demo/views/ninthSecondAfterLoginPage.dart';

class afterThirdPartProfileCreation extends StatefulWidget {
  final String enteredId;
  final String enteredUsername;
  final String enteredPassword;
  final String enteredEmail;
  final String enteredphoneNumber;
  const afterThirdPartProfileCreation({
    required this.enteredId,
    required this.enteredUsername,
    required this.enteredPassword,
    required this.enteredEmail,
    required this.enteredphoneNumber,
  });

  @override
  State<afterThirdPartProfileCreation> createState() =>
      _afterThirdPartProfileCreationState();
}

class _afterThirdPartProfileCreationState
    extends State<afterThirdPartProfileCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Either'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SixthOptionsToChoseEitherInvestororEntrepreneur(),
                  ),
                );
              },
              child: Text('Want to view all the investors or entrepreneurs'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
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
              child: Text('Go to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
