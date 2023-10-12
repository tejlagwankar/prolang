import 'package:flutter/material.dart';

class Chap1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('C: Chapter 1'),
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
// Types
///////////////////////////////////////

// Compilers that are not C99-compliant require that variables MUST be
// declared at the top of the current block scope.
// Compilers that ARE C99-compliant allow declarations near the point where
// the value is used.
// For the sake of the tutorial, variables are declared dynamically under
// C99-compliant standards.

// ints are usually 4 bytes (use the `sizeof` operator to check)
int x_int = 0;

// shorts are usually 2 bytes (use the `sizeof` operator to check)
short x_short = 0;

// chars are defined as the smallest addressable unit for a processor.
// This is usually 1 byte, but for some systems it can be more (ex. for TMS320 from TI it's 2 bytes).
char x_char = 0;
char y_char = 'y'; // Char literals are quoted with ''

// longs are often 4 to 8 bytes; long longs are guaranteed to be at least
// 8 bytes
long x_long = 0;
long long x_long_long = 0;

// floats are usually 32-bit floating point numbers
float x_float = 0.0f; // 'f' suffix here denotes floating point literal

// doubles are usually 64-bit floating-point numbers
double x_double = 0.0; // real numbers without any suffix are doubles

// integer types may be unsigned (greater than or equal to zero)
unsigned short ux_short;
unsigned int ux_int;
unsigned long long ux_long_long;

// chars inside single quotes are integers in machine's character set.
'0'; // => 48 in the ASCII character set.
'A'; // => 65 in the ASCII character set.

// sizeof(T) gives you the size of a variable with type T in bytes
// sizeof(obj) yields the size of the expression (variable, literal, etc.).
printf("%zu\n", sizeof(int)); // => 4 (on most machines with 4-byte words)

// If the argument of the `sizeof` operator is an expression, then its argument
// is not evaluated (except VLAs (see below)).
// The value it yields in this case is a compile-time constant.
int a = 1;
// size_t is an unsigned integer type of at least 2 bytes used to represent
// the size of an object.
size_t size = sizeof(a++); // a++ is not evaluated
printf("sizeof(a++) = %zu where a = %d\n", size, a);
// prints "sizeof(a++) = 4 where a = 1" (on a 32-bit architecture)

// Arrays must be initialized with a concrete size.
char my_char_array[20]; // This array occupies 1 * 20 = 20 bytes
int my_int_array[20]; // This array occupies 4 * 20 = 80 bytes
// (assuming 4-byte words)

// You can initialize an array of twenty ints that all equal 0 thusly:
int my_array[20] = {0};
// where the "{0}" part is called an "array initializer".
// All elements (if any) past the ones in the initializer are initialized to 0:
int my_array[5] = {1, 2};
// So my_array now has five elements, all but the first two of which are 0:
// [1, 2, 0, 0, 0]
// NOTE that you get away without explicitly declaring the size
// of the array IF you initialize the array on the same line:
int my_array[] = {0};
// NOTE that, when not declaring the size, the size of the array is the number
// of elements in the initializer. With "{0}", my_array is now of size one: [0]
// To evaluate the size of the array at run-time, divide its byte size by the
// byte size of its element type:
size_t my_array_size = sizeof(my_array) / sizeof(my_array[0]);
// WARNING You should evaluate the size *before* you begin passing the array
// to functions (see later discussion) because arrays get "downgraded" to
// raw pointers when they are passed to functions (so the statement above
// will produce the wrong result inside the function).

// Indexing an array is like other languages -- or,
// rather, other languages are like C
my_array[0]; // => 0

// Arrays are mutable; it's just memory!
my_array[1] = 2;
printf("%d\n", my_array[1]); // => 2

// In C99 (and as an optional feature in C11), variable-length arrays (VLAs)
// can be declared as well. The size of such an array need not be a compile
// time constant:
printf("Enter the array size: "); // ask the user for an array size
int array_size;
fscanf(stdin, "%d", &array_size);
int var_length_array[array_size]; // declare the VLA
printf("sizeof array = %zu\n", sizeof var_length_array);

// Example:
// > Enter the array size: 10
// > sizeof array = 40

// Strings are just arrays of chars terminated by a NULL (0x00) byte,
// represented in strings as the special character '\0'.
// (We don't have to include the NULL byte in string literals; the compiler
//  inserts it at the end of the array for us.)
char a_string[20] = "This is a string";
printf("%s\n", a_string); // %s formats a string

printf("%d\n", a_string[16]); // => 0
// i.e., byte #17 is 0 (as are 18, 19, and 20)

// If we have characters between single quotes, that's a character literal.
// It's of type `int`, and *not* `char` (for historical reasons).
int cha = 'a'; // fine
char chb = 'a'; // fine too (implicit conversion from int to char)

// Multi-dimensional arrays:
int multi_array[2][5] = {
  {1, 2, 3, 4, 5},
  {6, 7, 8, 9, 0}
};
// access elements:
int array_int = multi_array[0][2]; // => 3


///////////////////////////////////////
// Operators
///////////////////////////////////////

// Shorthands for multiple declarations:
int i1 = 1, i2 = 2;
float f1 = 1.0, f2 = 2.0;

int b, c;
b = c = 0;

// Arithmetic is straightforward
i1 + i2; // => 3
i2 - i1; // => 1
i2 * i1; // => 2
i1 / i2; // => 0 (0.5, but truncated towards 0)

// You need to cast at least one integer to float to get a floating-point result
(float)i1 / i2; // => 0.5f
i1 / (double)i2; // => 0.5 // Same with double
f1 / f2; // => 0.5, plus or minus epsilon

// Floating-point numbers are defined by IEEE 754, thus cannot store perfectly
// exact values. For instance, the following does not produce expected results
// because 0.1 might actually be 0.099999999999 inside the computer, and 0.3
// might be stored as 0.300000000001.
(0.1 + 0.1 + 0.1) != 0.3; // => 1 (true)
// and it is NOT associative due to reasons mentioned above.
1 + (1e123 - 1e123) != (1 + 1e123) - 1e123; // => 1 (true)
// this notation is scientific notations for numbers: 1e123 = 1*10^123

// It is important to note that most all systems have used IEEE 754 to
// represent floating points. Even python, used for scientific computing,
// eventually calls C which uses IEEE 754. It is mentioned this way not to
// indicate that this is a poor implementation, but instead as a warning
// that when doing floating point comparisons, a little bit of error (epsilon)
// needs to be considered.

// Modulo is there as well, but be careful if arguments are negative
11 % 3;    // => 2 as 11 = 2 + 3*x (x=3)
(-11) % 3; // => -2, as one would expect
11 % (-3); // => 2 and not -2, and it's quite counter intuitive

// Comparison operators are probably familiar, but
// there is no Boolean type in C. We use ints instead.
// (C99 introduced the _Bool type provided in stdbool.h)
// 0 is false, anything else is true. (The comparison
// operators always yield 0 or 1.)
3 == 2; // => 0 (false)
3 != 2; // => 1 (true)
3 > 2;  // => 1
3 < 2;  // => 0
2 <= 2; // => 1
2 >= 2; // => 1

// C is not Python - comparisons do NOT chain.
// Warning: The line below will compile, but it means `(0 < a) < 2`.
// This expression is always true, because (0 < a) could be either 1 or 0.
// In this case it's 1, because (0 < 1).
int between_0_and_2 = 0 < a < 2;
// Instead use:
int between_0_and_2 = 0 < a && a < 2;

// Logic works on ints
!3; // => 0 (Logical not)
!0; // => 1
1 && 1; // => 1 (Logical and)
0 && 1; // => 0
0 || 1; // => 1 (Logical or)
0 || 0; // => 0

// Conditional ternary expression ( ? : )
int e = 5;
int f = 10;
int z;
z = (e > f) ? e : f; // => 10 "if e > f return e, else return f."

// Increment and decrement operators:
int j = 0;
int s = j++; // Return j THEN increase j. (s = 0, j = 1)
s = ++j; // Increase j THEN return j. (s = 2, j = 2)
// same with j-- and --j

// Bitwise operators!
~0x0F; // => 0xFFFFFFF0 (bitwise negation, "1's complement", example result for 32-bit int)
0x0F & 0xF0; // => 0x00 (bitwise AND)
0x0F | 0xF0; // => 0xFF (bitwise OR)
0x04 ^ 0x0F; // => 0x0B (bitwise XOR)
0x01 << 1; // => 0x02 (bitwise left shift (by 1))
0x02 >> 1; // => 0x01 (bitwise right shift (by 1))

// Be careful when shifting signed integers - the following are undefined:
// - shifting into the sign bit of a signed integer (int a = 1 << 31)
// - left-shifting a negative number (int a = -1 << 2)
// - shifting by an offset which is >= the width of the type of the LHS:
//   int a = 1 << 32; // UB if int is 32 bits wide

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
