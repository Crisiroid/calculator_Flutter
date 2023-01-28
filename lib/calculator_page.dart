// ignore_for_file: prefer_const_constructors

import 'package:calculator/customBtn.dart';
import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String input = "0";
  String output = "0";
  List<String> buttons = [
    'AC',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'C',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 48, 29, 47),
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  input,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  output,
                  style: TextStyle(fontSize: 42, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.white),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: buttons.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 22, mainAxisSpacing: 22),
            itemBuilder: (BuildContext context, int index) {
              return customBtn(text: buttons[index]);
            },
          ),
        ))
      ]),
    );
  }
}
