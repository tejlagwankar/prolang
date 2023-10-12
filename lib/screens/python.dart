import 'package:flutter/material.dart';
import 'package:flutter_application_1/chapters/python/chap1.dart';
import 'package:flutter_application_1/chapters/python/chap2.dart';
import 'package:flutter_application_1/chapters/python/chap3.dart';
import 'package:flutter_application_1/chapters/python/chap4.dart';
import 'package:flutter_application_1/chapters/python/chap5.dart';
import 'package:flutter_application_1/chapters/python/chap6.dart';

class PythonScreen extends StatelessWidget {
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
        title: Text('Python'),
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
                        '1. Primitive Datatypes and Operators') {
                      Navigator.pushNamed(context, '/chap1');
                    } else if (programmingLanguages[index] ==
                        '2. Variables and Collections') {
                      Navigator.pushNamed(context, '/chap2');
                    } else if (programmingLanguages[index] ==
                        '3. Control Flow and Iterables') {
                      Navigator.pushNamed(context, '/chap3');
                    } else if (programmingLanguages[index] == '4. Functions') {
                      Navigator.pushNamed(context, '/chap4');
                    } else if (programmingLanguages[index] == '5. Modules') {
                      Navigator.pushNamed(context, '/chap5');
                    } else if (programmingLanguages[index] == '6. Classes') {
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
    '1. Primitive Datatypes and Operators',
    '2. Variables and Collections',
    '3. Control Flow and Iterables',
    '4. Functions',
    '5. Modules',
    '6. Classes',
  ];
}
