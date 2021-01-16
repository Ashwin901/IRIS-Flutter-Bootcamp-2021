import 'package:flutter/material.dart';
import 'package:calculator/widgets/calc_button.dart';
import 'package:calculator/widgets/calc_row.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Color buttonColor = Color(0xfffca652);
  String equation = "";
  String result = "";

  dynamic onPressed(String value) {
    if (value == "AC") {
      equation = "";
      result = "";
    } else if (value == "<") {
      if (equation.length > 0) {
        equation = equation.substring(0, equation.length - 1);
      }
    } else {
      result = "";
      equation = equation + value;
    }
    setState(() {});
  }

  void calculateExpression() {
    double eval;
    if (equation.length > 0) {
      equation = equation.replaceAll('x', '*');
      Parser p = Parser();
      Expression exp = p.parse(equation);
      ContextModel cm = ContextModel();
      eval = exp.evaluate(EvaluationType.REAL, cm);
    }
    result = eval.toString();
    equation = "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff393e46),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: size.width * 0.75,
                height: size.height * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      equation,
                      style: TextStyle(color: buttonColor, fontSize: 30),
                    ),
                    Text(
                      result == null ? "" : result,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.75,
                      child: Table(
                        children: [
                          row([
                            "AC",
                            "<",
                            "^"
                          ], [
                            () {
                              onPressed("AC");
                            },
                            () {
                              onPressed("<");
                            },
                            () {
                              onPressed("^");
                            }
                          ], buttonColor),
                          for (int i = 9; i > 0; i -= 3)
                            row([
                              (i - 2).toString(),
                              (i - 1).toString(),
                              i.toString()
                            ], [
                              () {
                                onPressed((i - 2).toString());
                              },
                              () {
                                onPressed((i - 1).toString());
                              },
                              () {
                                onPressed(i.toString());
                              }
                            ], Colors.white),
                          row([
                            "%",
                            "0",
                            "."
                          ], [
                            () {
                              onPressed("%");
                            },
                            () {
                              onPressed("0");
                            },
                            () {
                              onPressed(".");
                            }
                          ], Colors.white)
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.25,
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              CalcButtons(
                                text: "x",
                                color: buttonColor,
                                onPressed: () {
                                  onPressed("x");
                                },
                              )
                            ],
                          ),
                          TableRow(
                            children: [
                              CalcButtons(
                                  text: "+",
                                  color: buttonColor,
                                  onPressed: () {
                                    onPressed("+");
                                  })
                            ],
                          ),
                          TableRow(
                            children: [
                              CalcButtons(
                                  text: "-",
                                  color: buttonColor,
                                  onPressed: () {
                                    onPressed("-");
                                  })
                            ],
                          ),
                          TableRow(
                            children: [
                              CalcButtons(
                                  text: "/",
                                  color: buttonColor,
                                  onPressed: () {
                                    onPressed("/");
                                  })
                            ],
                          ),
                          TableRow(
                            children: [
                              FloatingActionButton(
                                onPressed: calculateExpression,
                                child: Text(
                                  '=',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                backgroundColor: buttonColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
