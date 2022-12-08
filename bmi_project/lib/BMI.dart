import 'dart:math';
import 'dart:ui';

import 'package:bmi_project/BMI_Resultscreen.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class BMI_screen extends StatefulWidget {
  const BMI_screen({super.key});

  @override
  State<BMI_screen> createState() => _BMI_screenState();
}

// ignore: camel_case_types
class _BMI_screenState extends State<BMI_screen> {
  bool ismale = true;
  double height = 80;
  int age = 20;
  int wight = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        ismale = true;
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ismale ? Colors.blue : Colors.grey[400]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              height: 6,
                            ),
                            Image(
                              image: AssetImage("images/male.png"),
                              height: 60,
                              width: 60,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "MALE",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        ismale = false;
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ismale ? Colors.grey[400] : Colors.blue),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage("images/famale.png"),
                              height: 70,
                              width: 70,
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              "FEMALE",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${height.round()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 37),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "CM",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                  Slider(
                      value: height,
                      max: 220,
                      min: 80,
                      onChanged: (Value) {
                        setState(() {
                          height = Value;
                        });
                      })
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          '${wight}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  wight--;
                                });
                              },
                              heroTag: 'wight--',
                              mini: true,
                              child: Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    wight++;
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.add),
                                heroTag: 'wight++')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "${age}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.remove),
                                heroTag: 'age--'),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              mini: true,
                              child: Icon(Icons.add),
                              heroTag: 'age++',
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.blue,
            child: MaterialButton(
              onPressed: () {
                double result = wight / pow(height / 100, 2);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMIResultscreen(
                              age: age,
                              result: result.round(),
                              ismale: ismale,
                            )));
              },
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
            ),
          )
        ],
      ),
    );
  }
}
