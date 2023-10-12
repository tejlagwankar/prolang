import 'package:flutter/material.dart';

class Chap4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('C: Chapter 4'),
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
///////////////////
// Functions
///////////////////

// Function declaration syntax:
// <return type> <function name>(<args>)

int add_two_ints(int x1, int x2)
{
  return x1 + x2; // Use return to return a value
}

/*
Functions are call by value. When a function is called, the arguments passed to
the function are copies of the original arguments (except arrays). Anything you
do to the arguments in the function do not change the value of the original
argument where the function was called.

Use pointers if you need to edit the original argument values (arrays are always
passed in as pointers).

Example: in-place string reversal
*/

// A void function returns no value
void str_reverse(char *str_in)
{
  char tmp;
  size_t ii = 0;
  size_t len = strlen(str_in); // `strlen()` is part of the c standard library
                               // NOTE: length returned by `strlen` DOESN'T
                               //       include the terminating NULL byte ('\0')
  // in C99 and newer versions, you can directly declare loop control variables
  // in the loop's parentheses. e.g., `for (size_t ii = 0; ...`
  for (ii = 0; ii < len / 2; ii++) {
    tmp = str_in[ii];
    str_in[ii] = str_in[len - ii - 1]; // ii-th char from end
    str_in[len - ii - 1] = tmp;
  }
}
//NOTE: string.h header file needs to be included to use strlen()

/*
char c[] = "This is a test.";
str_reverse(c);
printf("%s\n", c); // => ".tset a si sihT"
*/
/*
as we can return only one variable
to change values of more than one variables we use call by reference
*/
void swapTwoNumbers(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}
/*
int first = 10;
int second = 20;
printf("first: %d\nsecond: %d\n", first, second);
swapTwoNumbers(&first, &second);
printf("first: %d\nsecond: %d\n", first, second);
// values will be swapped
*/

// Return multiple values.
// C does not allow for returning multiple values with the return statement. If
// you would like to return multiple values, then the caller must pass in the
// variables where they would like the returned values to go. These variables must
// be passed in as pointers such that the function can modify them.
int return_multiple( int *array_of_3, int *ret1, int *ret2, int *ret3)
{
    if(array_of_3 == NULL)
        return 0; //return error code (false)

    //de-reference the pointer so we modify its value
   *ret1 = array_of_3[0];
   *ret2 = array_of_3[1];
   *ret3 = array_of_3[2];

   return 1; //return error code (true)
}

/*
With regards to arrays, they will always be passed to functions
as pointers. Even if you statically allocate an array like `arr[10]`,
it still gets passed as a pointer to the first element in any function calls.
Again, there is no standard way to get the size of a dynamically allocated
array in C.
*/
// Size must be passed!
// Otherwise, this function has no way of knowing how big the array is.
void printIntArray(int *arr, size_t size) {
    int i;
    for (i = 0; i < size; i++) {
        printf("arr[%d] is: %d\n", i, arr[i]);
    }
}
/*
int my_arr[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
int size = 10;
printIntArray(my_arr, size);
// will print "arr[0] is: 1" etc
*/

// if referring to external variables outside function, you should use the extern keyword.
int i = 0;
void testFunc() {
  extern int i; //i here is now using external variable i
}

// make external variables private to source file with static:
static int j = 0; //other files using testFunc2() cannot access variable j
void testFunc2() {
  extern int j;
}
// The static keyword makes a variable inaccessible to code outside the
// compilation unit. (On almost all systems, a "compilation unit" is a .c
// file.) static can apply both to global (to the compilation unit) variables,
// functions, and function-local variables. When using static with
// function-local variables, the variable is effectively global and retains its
// value across function calls, but is only accessible within the function it
// is declared in. Additionally, static variables are initialized to 0 if not
// declared with some other starting value.
//**You may also declare functions as static to make them private**

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
