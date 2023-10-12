import 'package:flutter/material.dart';

class Chap1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Java: Chapter 1'),
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
// Input/Output
///////////////////////////////////////

/*
* Output
*/

// Use System.out.println() to print lines.
System.out.println("Hello World!");
System.out.println(
    "Integer: " + 10 +
    " Double: " + 3.14 +
    " Boolean: " + true);

// To print without a newline, use System.out.print().
System.out.print("Hello ");
System.out.print("World");

// Use System.out.printf() for easy formatted printing.
System.out.printf("pi = %.5f", Math.PI); // => pi = 3.14159

/*
  * Input
  */

// use Scanner to read input
// must import java.util.Scanner;
Scanner scanner = new Scanner(System.in);

// read string input
String name = scanner.next();

// read byte input
byte numByte = scanner.nextByte();

// read int input
int numInt = scanner.nextInt();

// read long input
long numLong = scanner.nextLong();

// read float input
float numFloat = scanner.nextFloat();

// read double input
double numDouble = scanner.nextDouble();

// read boolean input
boolean bool = scanner.nextBoolean();

///////////////////////////////////////
// Operators
///////////////////////////////////////
System.out.println("\n->Operators");

int i1 = 1, i2 = 2; // Shorthand for multiple declarations

// Arithmetic is straightforward
System.out.println("1+2 = " + (i1 + i2)); // => 3
System.out.println("2-1 = " + (i2 - i1)); // => 1
System.out.println("2*1 = " + (i2 * i1)); // => 2
System.out.println("1/2 = " + (i1 / i2)); // => 0 (int/int returns int)
System.out.println("1/2.0 = " + (i1 / (double)i2)); // => 0.5

// Modulo
System.out.println("11%3 = " + (11 % 3)); // => 2

// Comparison operators
System.out.println("3 == 2? " + (3 == 2)); // => false
System.out.println("3 != 2? " + (3 != 2)); // => true
System.out.println("3 > 2? " + (3 > 2)); // => true
System.out.println("3 < 2? " + (3 < 2)); // => false
System.out.println("2 <= 2? " + (2 <= 2)); // => true
System.out.println("2 >= 2? " + (2 >= 2)); // => true

// Boolean operators
System.out.println("3 > 2 && 2 > 3? " + ((3 > 2) && (2 > 3))); // => false
System.out.println("3 > 2 || 2 > 3? " + ((3 > 2) || (2 > 3))); // => true
System.out.println("!(3 == 2)? " + (!(3 == 2))); // => true

// Bitwise operators!
/*
~      Unary bitwise complement
<<     Signed left shift
>>     Signed/Arithmetic right shift
>>>    Unsigned/Logical right shift
&      Bitwise AND
^      Bitwise exclusive OR
|      Bitwise inclusive OR
*/

// Increment operators
int i = 0;
System.out.println("\n->Inc/Dec-rementation");
// The ++ and -- operators increment and decrement by 1 respectively.
// If they are placed before the variable, they increment then return;
// after the variable they return then increment.
System.out.println(i++); // i = 1, prints 0 (post-increment)
System.out.println(++i); // i = 2, prints 2 (pre-increment)
System.out.println(i--); // i = 1, prints 2 (post-decrement)
System.out.println(--i); // i = 0, prints 0 (pre-decrement)

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
