import 'package:flutter/material.dart';
import 'dart:math';
// class HomePage extends StatelessWidget {
//   final Map<String, dynamic> arguments;

//   HomePage({required this.arguments});

//   @override
//   Widget build(BuildContext context) {
//     final String username = arguments['username'];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HomePage'),
//       ),
//       body: Center(
//         child: Text('Halo, $username'),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  final String username;

  HomePage({required this.username});
  @override

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 197, 247),
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Halo, ${widget.username}!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            Image.asset(
              'images/3.jpg',
              height: 300,
              width: 300,
            ),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi Badan (cm)',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat Badan (kg)',
              ),
            ),
            SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
              ),    
              onPressed: _hitungBMI, 
              child: Text('Hitung'),
            ),
            SizedBox(height: 20.0),
            Text(
              'BMI: ${_bmiResult.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }

  void _hitungBMI() {
    double height = double.parse(_heightController.text) / 100.0;
    double weight = double.parse(_weightController.text);
    double bmi = weight / pow(height, 2);
    setState(() {
      _bmiResult = bmi;
    });
  }
}
