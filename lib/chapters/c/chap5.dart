import 'package:flutter/material.dart';

class Chap5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('C: Chapter 5'),
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
// Function pointers
///////////////////////////////////////
/*
At run time, functions are located at known memory addresses. Function pointers are
much like any other pointer (they just store a memory address), but can be used
to invoke functions directly, and to pass handlers (or callback functions) around.
However, definition syntax may be initially confusing.

Example: use str_reverse from a pointer
*/
void str_reverse_through_pointer(char *str_in) {
  // Define a function pointer variable, named f.
  void (*f)(char *); // Signature should exactly match the target function.
  f = &str_reverse; // Assign the address for the actual function (determined at run time)
  // f = str_reverse; would work as well - functions decay into pointers, similar to arrays
  (*f)(str_in); // Just calling the function through the pointer
  // f(str_in); // That's an alternative but equally valid syntax for calling it.
}

/*
As long as function signatures match, you can assign any function to the same pointer.
Function pointers are usually typedef'd for simplicity and readability, as follows:
*/

typedef void (*my_fnp_type)(char *);

// Then used when declaring the actual pointer variable:
// ...
// my_fnp_type f;



/******************************* Header Files **********************************

Header files are an important part of C as they allow for the connection of C
source files and can simplify code and definitions by separating them into
separate files.

Header files are syntactically similar to C source files but reside in ".h"
files. They can be included in your C source file by using the precompiler
command #include "example.h", given that example.h exists in the same directory
as the C file.
*/

/* A safe guard to prevent the header from being defined too many times. This */
/* happens in the case of circle dependency, the contents of the header is    */
/* already defined.                                                           */
#ifndef EXAMPLE_H /* if EXAMPLE_H is not yet defined. */
#define EXAMPLE_H /* Define the macro EXAMPLE_H. */

/* Other headers can be included in headers and therefore transitively */
/* included into files that include this header.                       */
#include <string.h>

/* Like for c source files, macros can be defined in headers */
/* and used in files that include this header file.          */
#define EXAMPLE_NAME "Dennis Ritchie"

/* Function macros can also be defined.  */
#define ADD(a, b) ((a) + (b))

/* Notice the parenthesis surrounding the arguments -- this is important to   */
/* ensure that a and b don't get expanded in an unexpected way (e.g. consider */
/* MUL(x, y) (x * y); MUL(1 + 2, 3) would expand to (1 + 2 * 3), yielding an  */
/* incorrect result)                                                          */

/* Structs and typedefs can be used for consistency between files. */
typedef struct Node
{
    int val;
    struct Node *next;
} Node;

/* So can enumerations. */
enum traffic_light_state {GREEN, YELLOW, RED};

/* Function prototypes can also be defined here for use in multiple files,  */
/* but it is bad practice to define the function in the header. Definitions */
/* should instead be put in a C file.                                       */
Node createLinkedList(int *vals, int len);

/* Beyond the above elements, other definitions should be left to a C source */
/* file. Excessive includes or definitions should also not be contained in   */
/* a header file but instead put into separate headers or a C file.          */

#endif /* End of the if precompiler directive. */
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
