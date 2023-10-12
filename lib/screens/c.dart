import 'package:flutter/material.dart';
import 'package:flutter_application_1/chapters/c/chap1.dart';
import 'package:flutter_application_1/chapters/c/chap2.dart';
import 'package:flutter_application_1/chapters/c/chap3.dart';
import 'package:flutter_application_1/chapters/c/chap4.dart';
import 'package:flutter_application_1/chapters/c/chap5.dart';

class CppScreen extends StatelessWidget {
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
        title: Text('C'),
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
                        '1. Types and Operators') {
                      Navigator.pushNamed(context, '/chap1');
                    } else if (programmingLanguages[index] ==
                        '2. Control Structures') {
                      Navigator.pushNamed(context, '/chap2');
                    } else if (programmingLanguages[index] == '3. Pointers') {
                      Navigator.pushNamed(context, '/chap3');
                    } else if (programmingLanguages[index] == '4. Functions') {
                      Navigator.pushNamed(context, '/chap4');
                    } else if (programmingLanguages[index] ==
                        '5. Function pointers and Header Files') {
                      Navigator.pushNamed(context, '/chap5');
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
    '1. Types and Operators',
    '2. Control Structures',
    '3. Pointers',
    '4. Functions',
    '5. Function pointers and Header Files',
  ];
}
