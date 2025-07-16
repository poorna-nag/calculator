import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String input = "";
  String calValue = "";
  String oparetor = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(238, 223, 215, 215),
                    ),
                    width: double.infinity,
                    height: 100,
                    alignment: Alignment.topCenter,
                    child: Text(input, style: TextStyle(fontSize: 70)),
                  ),
                  Row(
                    children: [
                      button("7", Colors.blueGrey),
                      button("8", Colors.blueGrey),
                      button("9", Colors.blueGrey),
                      button("*", Colors.amber),
                    ],
                  ),
                  Row(
                    children: [
                      button("4", Colors.blueGrey),
                      button("5", Colors.blueGrey),
                      button("6", Colors.blueGrey),
                      button("-", Colors.amber),
                    ],
                  ),
                  Row(
                    children: [
                      button("1", Colors.blueGrey),
                      button("2", Colors.blueGrey),
                      button("3", Colors.blueGrey),
                      button("+", Colors.amber),
                    ],
                  ),
                  Row(
                    children: [
                      button("AC", Colors.blueGrey),
                      button("0", Colors.blueGrey),
                      button("/", Colors.blueGrey),
                      button("=", Colors.amber),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget button(String text, Color bgColor) {
    return InkWell(
      onTap: () {
        if (text == "AC") {
          setState(() {
            input = "";
            calValue = "";
            oparetor = "";
          });
        } else if (text == "*" || text == "-" || text == "+" || text == "/") {
          setState(() {
            calValue = input;
            input = "";
            oparetor = text;
          });
        } else if (text == "=") {
          setState(() {
            double cv = double.parse(calValue);
            double inputvalue = double.parse(input);
            if (oparetor == "*") {
              input = (cv * inputvalue).toString();
            } else if (oparetor == "-") {
              input = (cv - inputvalue).toString();
            } else if (oparetor == "+") {
              input = (cv + inputvalue).toString();
            } else if (oparetor == "/") {
              input = (cv / inputvalue).toString();
            }
          });
        } else {
          setState(() {
            input = input + text;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: bgColor,
        ),
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.width / (kIsWeb ? 11 : 4),
        width: MediaQuery.of(context).size.width / (kIsWeb ? 12 : 5),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
