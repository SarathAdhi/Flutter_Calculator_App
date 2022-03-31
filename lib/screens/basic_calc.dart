// ignore_for_file: non_constant_identifier_names, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const IconData backspace =
      IconData(0xe0c5, fontFamily: 'MaterialIcons', matchTextDirection: true);
  var Row_1 = ["C", "backspace", "%", "÷"];
  var Row_2 = ["7", "8", "9", "x"];
  var Row_3 = ["4", "5", "6", "-"];
  var Row_4 = ["1", "2", "3", "+"];
  var Row_5 = ["", "0", ".", "="];
  String answer = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Calculator",
            style: TextStyle(color: Colors.black),
          )),
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
              height: 600,
              width: (MediaQuery.of(context).size.width) - 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    answer,
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var item in Row_1)
                        if (item != "backspace")
                          SizedBox(
                              width: 80,
                              height: 80,
                              child: FloatingActionButton(
                                focusColor: Colors.yellow,
                                backgroundColor:
                                    const Color.fromARGB(255, 41, 41, 41),
                                onPressed: () {
                                  if (item == "C") {
                                    setState(() {
                                      answer = "";
                                    });
                                  } else {
                                    setState(() {
                                      answer = answer + item;
                                    });
                                  }
                                },
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400),
                                ),
                              ))
                        else
                          SizedBox(
                              width: 80,
                              height: 80,
                              child: FloatingActionButton(
                                backgroundColor:
                                    const Color.fromARGB(255, 41, 41, 41),
                                onPressed: () {
                                  if (answer != "") {
                                    setState(() {
                                      answer = answer.substring(
                                          0, answer.length - 1);
                                    });
                                  }
                                },
                                child: const Icon(backspace),
                              ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var item in Row_2)
                        SizedBox(
                            width: 80,
                            height: 80,
                            child: FloatingActionButton(
                              backgroundColor:
                                  const Color.fromARGB(255, 41, 41, 41),
                              onPressed: () {
                                setState(() {
                                  answer = answer + item;
                                });
                              },
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w400),
                              ),
                            )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var item in Row_3)
                        SizedBox(
                            width: 80,
                            height: 80,
                            child: FloatingActionButton(
                              backgroundColor:
                                  const Color.fromARGB(255, 41, 41, 41),
                              onPressed: () {
                                setState(() {
                                  answer = answer + item;
                                });
                              },
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w400),
                              ),
                            )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var item in Row_4)
                        SizedBox(
                            width: 80,
                            height: 80,
                            child: FloatingActionButton(
                              backgroundColor:
                                  const Color.fromARGB(255, 41, 41, 41),
                              onPressed: () {
                                setState(() {
                                  answer = answer + item;
                                });
                              },
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w400),
                              ),
                            )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var item in Row_5)
                        SizedBox(
                            width: 80,
                            height: 80,
                            child: FloatingActionButton(
                              backgroundColor:
                                  const Color.fromARGB(255, 41, 41, 41),
                              onPressed: () {
                                setState(() {
                                  if (item == "=") {
                                    String finaluserinput = answer;
                                    finaluserinput =
                                        answer.replaceAll('x', '*');
                                    finaluserinput =
                                        finaluserinput.replaceAll('÷', '/');
                                    Parser p = Parser();
                                    Expression exp = p.parse(finaluserinput);
                                    ContextModel cm = ContextModel();
                                    double eval =
                                        exp.evaluate(EvaluationType.REAL, cm);
                                    answer = eval.toString();
                                  } else {
                                    answer = answer + item;
                                  }
                                });
                              },
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w400),
                              ),
                            )),
                    ],
                  ),
                ],
              )),
        ));
  }
}
