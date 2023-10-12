import 'package:flutter/material.dart';
// import 'screens/about_screen.dart'; // Import the AboutScreen class
import 'screens/python.dart'; // Import the AboutScreen class
import 'screens/javascript.dart'; // Import the AboutScreen class
import 'screens/java.dart'; // Import the AboutScreen class
import 'screens/c.dart'; // Import the AboutScreen class
import 'screens/ruby.dart'; // Import the AboutScreen class
import 'screens/kotlin.dart'; // Import the AboutScreen class

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeScreen(), // Use a custom home screen widget
      routes: {
        // '/about': (context) => AboutScreen(),
        '/python': (context) =>
            PythonScreen(), // Define the named route for AboutScreen
        '/javascript': (context) =>
            JavaScriptScreen(), // Define the named route for AboutScreen
        '/java': (context) =>
            JavaScreen(), // Define the named route for AboutScreen
        '/cpp': (context) =>
            CppScreen(), // Define the named route for AboutScreen
        '/ruby': (context) =>
            RubyScreen(), // Define the named route for AboutScreen
        '/kotlin': (context) =>
            KotlinScreen(), // Define the named route for AboutScreen
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
        title: Text('ProLang - Programming Learning App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(18.0),
            color: Color.fromARGB(255, 214, 214, 214),
            child: Text(
              'Programming Languages:',
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
                    if (programmingLanguages[index] == 'Python') {
                      Navigator.pushNamed(
                          context, '/python'); // Navigate to Python screen
                    } else if (programmingLanguages[index] == 'JavaScript') {
                      Navigator.pushNamed(
                          context, '/javascript'); // Navigate to Python screen
                    } else if (programmingLanguages[index] == 'Java') {
                      Navigator.pushNamed(
                          context, '/java'); // Navigate to Python screen
                    } else if (programmingLanguages[index] == 'C') {
                      Navigator.pushNamed(
                          context, '/cpp'); // Navigate to Python screen
                    } else if (programmingLanguages[index] == 'Ruby') {
                      Navigator.pushNamed(
                          context, '/ruby'); // Navigate to Python screen
                    } else if (programmingLanguages[index] == 'Kotlin') {
                      Navigator.pushNamed(
                          context, '/kotlin'); // Navigate to Python screen
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
    'Python',
    'JavaScript',
    'Java',
    'C',
    'Ruby',
    'Kotlin',
  ];
}
