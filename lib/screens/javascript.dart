import 'package:flutter/material.dart';
import 'package:flutter_application_1/chapters/javascript/chap1.dart';
import 'package:flutter_application_1/chapters/javascript/chap2.dart';
import 'package:flutter_application_1/chapters/javascript/chap3.dart';
import 'package:flutter_application_1/chapters/javascript/chap4.dart';
import 'package:flutter_application_1/chapters/javascript/chap5.dart';
import 'package:flutter_application_1/chapters/javascript/chap6.dart';

class JavaScriptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeScreen(), // Use a custom home screen widget
      routes: {
        '/chap1': (context) => Chap1(),
        '/chap2': (context) => Chap2(),
        '/chap3': (context) => Chap3(),
        '/chap4': (context) => Chap4(),
        '/chap5': (context) => Chap5(),
        '/chap6': (context) => Chap6(),
      },
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('JavaScript'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(18.0),
            color: Color.fromARGB(255, 214, 214, 214),
            child: const Text(
              'Chapters:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: programmingLanguages.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (programmingLanguages[index] ==
                        '1. Numbers, Strings and Operators') {
                      Navigator.pushNamed(context, '/chap1');
                    } else if (programmingLanguages[index] ==
                        '2. Variables, Arrays and Objects') {
                      Navigator.pushNamed(context, '/chap2');
                    } else if (programmingLanguages[index] ==
                        '3. Logic and Control Structures') {
                      Navigator.pushNamed(context, '/chap3');
                    } else if (programmingLanguages[index] ==
                        '4. Functions, Scope and Closures') {
                      Navigator.pushNamed(context, '/chap4');
                    } else if (programmingLanguages[index] ==
                        '5. More about Objects; Constructors and Prototypes') {
                      Navigator.pushNamed(context, '/chap5');
                    } else if (programmingLanguages[index] ==
                        '6. ES6 Additions') {
                      Navigator.pushNamed(context, '/chap6');
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    color: Color.fromARGB(255, 229, 231, 229),
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      programmingLanguages[index],
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  final List<String> programmingLanguages = [
    '1. Numbers, Strings and Operators',
    '2. Variables, Arrays and Objects',
    '3. Logic and Control Structures',
    '4. Functions, Scope and Closures',
    '5. More about Objects; Constructors and Prototypes',
    '6. ES6 Additions',
  ];
}
