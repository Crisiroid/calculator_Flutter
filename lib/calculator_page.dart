// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
              return customBtns(buttons[index]);
            },
          ),
        ))
      ]),
    );
  }

  Widget customBtns(String text) {
    return InkWell(
      splashColor: Color.fromARGB(255, 48, 29, 47),
      onTap: () {
        setState(() {
          calcButtons(text);
        });
      },
      child: Ink(
        decoration: BoxDecoration(
          color: getBgColor(text),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 0.6,
              offset: Offset(-3, -3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: getColor(text)),
          ),
        ),
      ),
    );
  }

  getColor(String text) {
    if (text == "/" ||
        text == "*" ||
        text == "+" ||
        text == "-" ||
        text == "C" ||
        text == "(" ||
        text == ")") {
      return Color.fromARGB(255, 252, 100, 100);
    }

    return Colors.white;
  }

  getBgColor(String text) {
    if (text == "AC") {
      return Color.fromARGB(255, 252, 100, 100);
    }
    if (text == "=") {
      return Color.fromARGB(255, 140, 100, 100);
    }

    return Color.fromARGB(255, 48, 29, 47);
  }

  calcButtons(String text) {
    if (text == "AC") {
      input = "";
      output = "0";
      return;
    }
    if (text == "C") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
        return;
      } else {
        return null;
      }
    }
    if (text == "=") {
      output = calculate();
      input = output;
      if (input.endsWith(".0")) {
        input = input.replaceAll(".0", "");
      }
      if (output.endsWith(".0")) {
        output = output.replaceAll(".0", "");
        return;
      }
    }

    input = input + text;
  }

  String calculate() {
    try {
      var exp = Parser().parse(input);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error calculating";
    }
  }
}
