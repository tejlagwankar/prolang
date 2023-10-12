import 'package:flutter/material.dart';

class Chap3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Java: Chapter 3'),
      ),
      body: const SingleChildScrollView(
        // Use SingleChildScrollView to enable scrolling
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '''
///////////////////////////////////////
// Control Structures
///////////////////////////////////////
System.out.println("\n->Control Structures");

// If statements are c-like
int j = 10;
if (j == 10) {
    System.out.println("I get printed");
} else if (j > 10) {
    System.out.println("I don't");
} else {
    System.out.println("I also don't");
}

// While loop
int fooWhile = 0;
while (fooWhile < 100) {
    System.out.println(fooWhile);
    // Increment the counter
    // Iterated 100 times, fooWhile 0,1,2...99
    fooWhile++;
}
System.out.println("fooWhile Value: " + fooWhile);

// Do While Loop
int fooDoWhile = 0;
do {
    System.out.println(fooDoWhile);
    // Increment the counter
    // Iterated 100 times, fooDoWhile 0->99
    fooDoWhile++;
} while (fooDoWhile < 100);
System.out.println("fooDoWhile Value: " + fooDoWhile);

// For Loop
// for loop structure => for(<start_statement>; <conditional>; <step>)
for (int fooFor = 0; fooFor < 10; fooFor++) {
    System.out.println(fooFor);
    // Iterated 10 times, fooFor 0->9
}
System.out.println("fooFor Value: " + fooFor);

// Nested For Loop Exit with Label
outer:
for (int i = 0; i < 10; i++) {
  for (int j = 0; j < 10; j++) {
    if (i == 5 && j ==5) {
      break outer;
      // breaks out of outer loop instead of only the inner one
    }
  }
}

// For Each Loop
// The for loop is also able to iterate over arrays as well as objects
// that implement the Iterable interface.
int[] fooList = {1, 2, 3, 4, 5, 6, 7, 8, 9};
// for each loop structure => for (<object> : <iterable>)
// reads as: for each element in the iterable
// note: the object type must match the element type of the iterable.
for (int bar : fooList) {
    System.out.println(bar);
    //Iterates 9 times and prints 1-9 on new lines
}

// Switch Case
// A switch works with the byte, short, char, and int data types.
// It also works with enumerated types (discussed in Enum Types), the
// String class, and a few special classes that wrap primitive types:
// Character, Byte, Short, and Integer.
// Starting in Java 7 and above, we can also use the String type.
// Note: Do remember that, not adding "break" at end any particular case ends up in
// executing the very next case(given it satisfies the condition provided) as well.
int month = 3;
String monthString;
switch (month) {
    case 1: monthString = "January";
            break;
    case 2: monthString = "February";
            break;
    case 3: monthString = "March";
            break;
    default: monthString = "Some other month";
              break;
}
System.out.println("Switch Case Result: " + monthString);


// Try-with-resources (Java 7+)
// Try-catch-finally statements work as expected in Java but in Java 7+
// the try-with-resources statement is also available. Try-with-resources
// simplifies try-catch-finally statements by closing resources
// automatically.

// In order to use a try-with-resources, include an instance of a class
// in the try statement. The class must implement java.lang.AutoCloseable.
try (BufferedReader br = new BufferedReader(new FileReader("foo.txt"))) {
    // You can attempt to do something that could throw an exception.
    System.out.println(br.readLine());
    // In Java 7, the resource will always be closed, even if it throws
    // an Exception.
} catch (Exception ex) {
    //The resource will be closed before the catch statement executes.
    System.out.println("readLine() failed.");
}
// No need for a finally statement in this case, the BufferedReader is
// already closed. This can be used to avoid certain edge cases where
// a finally statement might not be called.
// To learn more:
// https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html


// Conditional Shorthand
// You can use the '?' operator for quick assignments or logic forks.
// Reads as "If (statement) is true, use <first value>, otherwise, use
// <second value>"
int foo = 5;
String bar = (foo < 10) ? "A" : "B";
System.out.println("bar : " + bar); // Prints "bar : A", because the
// statement is true.
// Or simply
System.out.println("bar : " + (foo < 10 ? "A" : "B"));


      ''',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
