import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';

  void _onButtonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '';
      _num1 = 0;
      _num2 = 0;
      _operand = '';
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _output = '';
    } else if (buttonText == '=') {
      _num2 = double.parse(_output);
      if (_operand == '+') {
        _output = (_num1 + _num2).toString();
      } else if (_operand == '-') {
        _output = (_num1 - _num2).toString();
      } else if (_operand == '*') {
        _output = (_num1 * _num2).toString();
      } else if (_operand == '/') {
        if (_num2 != 0) {
          _output = (_num1 / _num2).toString();
        } else {
          _output = 'Error';
        }
      }
      _num1 = 0;
      _num2 = 0;
      _operand = '';
    } else {
      _output += buttonText;
    }

    setState(() {});
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: () {
            _onButtonPressed(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('7'),
                      buildButton('8'),
                      buildButton('9'),
                      buildButton('/'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('4'),
                      buildButton('5'),
                      buildButton('6'),
                      buildButton('*'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('1'),
                      buildButton('2'),
                      buildButton('3'),
                      buildButton('-'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('C'),
                      buildButton('0'),
                      buildButton('='),
                      buildButton('+'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
