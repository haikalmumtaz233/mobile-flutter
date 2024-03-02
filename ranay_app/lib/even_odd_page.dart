import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EvenOddPage extends StatefulWidget {
  const EvenOddPage({Key? key}) : super(key: key);

  @override
  EvenOddState createState() => EvenOddState();
}

class EvenOddState extends State<EvenOddPage> {
  final TextEditingController _numberController = TextEditingController();
  String _result = '';

  void _checkEvenOdd() {
    String input = _numberController.text;
    if (input.isEmpty) {
      _showAlertDialog("Please enter a number");
      return;
    }

    if (int.tryParse(input) == null) {
      _showAlertDialog("Please enter a valid number");
      return;
    }

    int number = int.parse(input);
    setState(() {
      _result = number % 2 == 0 ? 'Even' : 'Odd';
    });
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

    @override
    Widget build(BuildContext context) {
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
                      'Even Odd',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _numberController,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        hintText: 'Enter a Number',
                        labelText: 'Number',
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _checkEvenOdd,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(16),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            child: Text('Check', style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      _result,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
}