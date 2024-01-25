import 'package:flutter/material.dart';
import 'package:api_demo/views/FifthDisplayingAllEntrepreneurs.dart';
import 'package:api_demo/views/FifthDisplayingAllInvestors.dart';

class SixthOptionsToChoseEitherInvestororEntrepreneur extends StatelessWidget {
  const SixthOptionsToChoseEitherInvestororEntrepreneur({Key? key})
      : super(key: key);

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
                    builder: (context) => FifthDisplayingAllInvestors(),
                  ),
                );
              },
              child: Text('All Investors Profile'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Fifthdisplayingallentrepreneurs(),
                  ),
                );
              },
              child: Text('All Entrepreneurs Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
