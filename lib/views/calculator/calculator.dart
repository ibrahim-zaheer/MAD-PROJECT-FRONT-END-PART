import 'package:api_demo/views/pallete.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController initialInvestmentController = TextEditingController();
  TextEditingController currentInvestmentController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController netCashFlowController = TextEditingController();
  TextEditingController discountRateController = TextEditingController();

  double npvResult = 0.0;
  double irrResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Investfy Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Pallete.backgroundColor,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color of the back button
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              TextField(
                controller: initialInvestmentController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Initial Investment',
                  labelStyle: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
              TextField(
                controller: yearsController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Number of Years',
                  labelStyle: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
              TextField(
                controller: discountRateController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Tax Rate',
                  labelStyle: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  calculateResults();
                  // generateCSV();
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Pallete.borderColor, // Set the background color to grey
                ),
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Results',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 16),
              Text('Total Profit: $npvResult',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              SizedBox(height: 16),
              // Text('IRR: $irrResult%',
              //     style: TextStyle(color: Colors.white, fontSize: 16)),
              // SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void calculateResults() {
    double initialInvestment = double.parse(initialInvestmentController.text);
    int years = int.parse(yearsController.text);
    // double netCashFlow = double.parse(netCashFlowController.text);
    double discountRate = double.parse(discountRateController.text) / 100;

    setState(() {
      npvResult = calculateProfit(initialInvestment, discountRate, years);

      // IRR calculation needs more complex logic or external library, consider using a package like irr_calculator
      // Here, we'll use a placeholder value
      irrResult = 15.0;
    });
  }

  double calculateProfit(
      double initialInvestment, double discountRate, int years) {
    double value = ((initialInvestment * years) -
        (initialInvestment * years) * (discountRate / 100));

    return value;
  }
}
