import 'package:flutter/material.dart';

class Chap2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('C: Chapter 2'),
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
///////////////////////
// Control Structures
///////////////////////

if (0) {
  printf("I am never run\n");
} else if (0) {
  printf("I am also never run\n");
} else {
  printf("I print\n");
}

// While loops exist
int ii = 0;
while (ii < 10) { //ANY value less than ten is true.
  printf("%d, ", ii++); // ii++ increments ii AFTER using its current value.
} // => prints "0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "

printf("\n");

int kk = 0;
do {
  printf("%d, ", kk);
} while (++kk < 10); // ++kk increments kk BEFORE using its current value.
// => prints "0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "

printf("\n");

// For loops too
int jj;
for (jj=0; jj < 10; jj++) {
  printf("%d, ", jj);
} // => prints "0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "

printf("\n");

// *****NOTES*****:
// Loops and Functions MUST have a body. If no body is needed:
int i;
for (i = 0; i <= 5; i++) {
  ; // use semicolon to act as the body (null statement)
}
// Or
for (i = 0; i <= 5; i++);

// branching with multiple choices: switch()
switch (a) {
case 0: // labels need to be integral *constant* expressions (such as enums)
  printf("Hey, 'a' equals 0!\n");
  break; // if you don't break, control flow falls over labels
case 1:
  printf("Huh, 'a' equals 1!\n");
  break;
  // Be careful - without a "break", execution continues until the
  // next "break" is reached.
case 3:
case 4:
  printf("Look at that.. 'a' is either 3, or 4\n");
  break;
default:
  // if `some_integral_expression` didn't match any of the labels
  fputs("Error!\n", stderr);
  exit(-1);
  break;
}
/*
  Using "goto" in C
*/
typedef enum { false, true } bool;
// for C don't have bool as data type before C99 :(
bool disaster = false;
int i, j;
for(i=0; i<100; ++i)
for(j=0; j<100; ++j)
{
  if((i + j) >= 150)
      disaster = true;
  if(disaster)
      goto error;  // exit both for loops
}
error: // this is a label that you can "jump" to with "goto error;"
printf("Error occurred at i = %d & j = %d.\n", i, j);
/*
  https://ideone.com/GuPhd6
  this will print out "Error occurred at i = 51 & j = 99."
*/
/*
  it is generally considered bad practice to do so, except if
  you really know what you are doing. See
  https://en.wikipedia.org/wiki/Spaghetti_code#Meaning
*/

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
