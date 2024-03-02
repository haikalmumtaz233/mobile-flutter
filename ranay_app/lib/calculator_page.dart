import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage ({Key? key}) : super(key: key);

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    // Calculator
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Calculator',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Value 1',
                      labelStyle: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*(\.[0-9]*)?')),
                      // Formatter yang berfungsi untuk menetapkan inputan dari userr
                      // User dapat menginputkan angka-angka, dan juga opsional satu titik (angka desimal)
                    ],
                    onChanged: (value) {
                      numOne = double.tryParse(value) ?? 0;
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Enter Value 2',
                        labelStyle: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*(\.[0-9]*)?')),
                    ],
                    onChanged: (value) {
                      numTwo = double.tryParse(value) ?? 0;
                    },
                  ),
                  SizedBox(height: 20),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '$text',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                              ),
                            ),
                          )
                        ],
                      ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              calculation('+');
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(16),
                              backgroundColor: Colors.amber[700],
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              '+',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              calculation('-');
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(16),
                              backgroundColor: Colors.amber[700],
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              '-',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ); // Change the background color to light black
  }

  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';

  void calculation(btnText) {
    if (btnText == '+') {
      result = (numOne + numTwo).toString();
    } else if (btnText == '-') {
      result = (numOne - numTwo).toString();
    }

    text = result;

    setState(() {});
  }
}
