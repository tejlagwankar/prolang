import 'package:flutter/material.dart';

class Chap4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Java: Chapter 4'),
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
// Classes And Functions
///////////////////////////////////////

    System.out.println("\n->Classes & Functions");

    // (definition of the Bicycle class follows)

    // Use new to instantiate a class
    Bicycle trek = new Bicycle();

    // Call object methods
    trek.speedUp(3); // You should always use setter and getter methods
    trek.setCadence(100);

    // toString returns this Object's string representation.
    System.out.println("trek info: " + trek.toString());
  } // End main method

  private static class TestInitialization {
    // Double Brace Initialization
    // Before Java 11, the Java Language had no syntax for how to create
    // static Collections in an easy way. Usually you end up like this:
    private static final Set<String> COUNTRIES = new HashSet<String>();
    static {
        COUNTRIES.add("DENMARK");
        COUNTRIES.add("SWEDEN");
        COUNTRIES.add("FINLAND");
    }

    // There's a nifty way to achieve the same thing, 
    // by using something that is called Double Brace Initialization.
    private static final Set<String> COUNTRIES_DOUBLE_BRACE = 
    new HashSet<String>() {{
        add("DENMARK");
        add("SWEDEN");
        add("FINLAND");
    }}

    // The first brace is creating a new AnonymousInnerClass and the
    // second one declares an instance initializer block. This block
    // is called when the anonymous inner class is created.
    // This does not only work for Collections, it works for all
    // non-final classes.


    // Another option was to initialize the Collection from an array,
    // using Arrays.asList() method:
    private static final List<String> COUNTRIES_AS_LIST = 
                    Arrays.asList("SWEDEN", "DENMARK", "NORWAY");
    // This has one catch: the list we get is internally backed by the array,
    // and since arrays can't change their size, the list backed by the array
    // is not resizeable, which means we can't add new elements to it: 
    public static void main(String[] args) {
        COUNTRIES.add("FINLAND"); // throws UnsupportedOperationException!
        // However, we can replace elements by index, just like in array: 
        COUNTRIES.set(1, "FINLAND");
        System.out.println(COUNTRIES); // prints [SWEDEN, FINLAND, NORWAY]
    }
    // The resizing problem can be circumvented 
    // by creating another Collection from the List:
      private static final Set<String> COUNTRIES_SET = 
            new HashSet<>(Arrays.asList("SWEDEN", "DENMARK", "NORWAY"));
    // It's perfectly fine to add anything to the Set of COUNTRIES now. 
  } // End TestInitialization class

  private static class TestJava11Initialization {
    // Since Java 11, there is a convenient option to initialize Collections:
    // Set.of() and List.of() methods. 
    private static final Set<String> COUNTRIES = 
            Set.of("SWEDEN", "DENMARK", "NORWAY");
    // There is a massive catch, though: Lists and Sets initialized like this 
    // 1) are immutable 
    // 2) can't contain null elements (even check for null elements fails)!
    public static void main(String[] args) {
        COUNTRIES.add("FINLAND"); // throws UnsupportedOperationException
        COUNTRIES.remove("NORWAY"); // throws UnsupportedOperationException 
        COUNTRIES.contains(null); // throws NullPointerException
    }
    private static final Set<String> COUNTRIES_WITH_NULL = 
                Set.of("SWEDEN", null, "NORWAY"); // throws NullPointerException

  } // End TestJava11Initialization class
  } // End LearnJava class

// You can include other, non-public outer-level classes in a .java file,
// but it is not good practice. Instead split classes into separate files.

// Class Declaration Syntax:
// <public/private/protected> class <class name> {
//    // data fields, constructors, functions all inside.
//    // functions are called as methods in Java.
// }

class Bicycle {

    // Bicycle's Fields/Variables
    public int cadence; // Public: Can be accessed from anywhere
    private int speed;  // Private: Only accessible from within the class
    protected int gear; // Protected: Accessible from the class and subclasses
    String name; // default: Only accessible from within this package
    static String className; // Static class variable

    // Static block
    // Java has no implementation of static constructors, but
    // has a static block that can be used to initialize class variables
    // (static variables).
    // This block will be called when the class is loaded.
    static {
        className = "Bicycle";
    }

    // Constructors are a way of creating classes
    // This is a constructor
    public Bicycle() {
        // You can also call another constructor:
        // this(1, 50, 5, "Bontrager");
        gear = 1;
        cadence = 50;
        speed = 5;
        name = "Bontrager";
    }
    // This is a constructor that takes arguments
    public Bicycle(int startCadence, int startSpeed, int startGear,
        String name) {
        this.gear = startGear;
        this.cadence = startCadence;
        this.speed = startSpeed;
        this.name = name;
    }

    // Method Syntax:
    // <public/private/protected> <return type> <function name>(<args>)

    // Java classes often implement getters and setters for their fields

    // Method declaration syntax:
    // <access modifier> <return type> <method name>(<args>)
    public int getCadence() {
        return cadence;
    }

    // void methods require no return statement
    public void setCadence(int newValue) {
        cadence = newValue;
    }
    public void setGear(int newValue) {
        gear = newValue;
    }
    public void speedUp(int increment) {
        speed += increment;
    }
    public void slowDown(int decrement) {
        speed -= decrement;
    }
    public void setName(String newName) {
        name = newName;
    }
    public String getName() {
        return name;
    }

    //Method to display the attribute values of this Object.
    @Override // Inherited from the Object class.
    public String toString() {
        return "gear: " + gear + " cadence: " + cadence + " speed: " + speed +
            " name: " + name;
    }
} // end class Bicycle

// PennyFarthing is a subclass of Bicycle
class PennyFarthing extends Bicycle {
    // (Penny Farthings are those bicycles with the big front wheel.
    // They have no gears.)

    public PennyFarthing(int startCadence, int startSpeed) {
        // Call the parent constructor with super
        super(startCadence, startSpeed, 0, "PennyFarthing");
    }

    // You should mark a method you're overriding with an @annotation.
    // To learn more about what annotations are and their purpose check this
    // out: http://docs.oracle.com/javase/tutorial/java/annotations/
    @Override
    public void setGear(int gear) {
        this.gear = 0;
    }
}

// Object casting
// Since the PennyFarthing class is extending the Bicycle class, we can say
// a PennyFarthing is a Bicycle and write :
// Bicycle bicycle = new PennyFarthing();
// This is called object casting where an object is taken for another one. There
// are lots of details and deals with some more intermediate concepts here:
// https://docs.oracle.com/javase/tutorial/java/IandI/subclasses.html

// Interfaces
// Interface declaration syntax
// <access-level> interface <interface-name> extends <super-interfaces> {
//     // Constants
//     // Method declarations
// }

// Example - Food:
public interface Edible {
    public void eat(); // Any class that implements this interface, must
                       // implement this method.
}

public interface Digestible {
    public void digest();
    // Since Java 8, interfaces can have default method.
    public default void defaultMethod() {
        System.out.println("Hi from default method ...");
    }
}

// We can now create a class that implements both of these interfaces.
public class Fruit implements Edible, Digestible {
    @Override
    public void eat() {
        // ...
    }

    @Override
    public void digest() {
        // ...
    }
}

// In Java, you can extend only one class, but you can implement many
// interfaces. For example:
public class ExampleClass extends ExampleClassParent implements InterfaceOne,
    InterfaceTwo {
    @Override
    public void InterfaceOneMethod() {
    }

    @Override
    public void InterfaceTwoMethod() {
    }

}

// Abstract Classes

// Abstract Class declaration syntax
// <access-level> abstract class <abstract-class-name> extends
// <super-abstract-classes> {
//     // Constants and variables
//     // Method declarations
// }

// Abstract Classes cannot be instantiated.
// Abstract classes may define abstract methods.
// Abstract methods have no body and are marked abstract
// Non-abstract child classes must @Override all abstract methods
// from their super-classes.
// Abstract classes can be useful when combining repetitive logic
// with customised behavior, but as Abstract classes require
// inheritance, they violate "Composition over inheritance"
// so consider other approaches using composition.
// https://en.wikipedia.org/wiki/Composition_over_inheritance

public abstract class Animal
{
    private int age;

    public abstract void makeSound();

    // Method can have a body
    public void eat()
    {
        System.out.println("I am an animal and I am Eating.");
        // Note: We can access private variable here.
        age = 30;
    }

    public void printAge()
    {
        System.out.println(age);
    }

    // Abstract classes can have main method.
    public static void main(String[] args)
    {
        System.out.println("I am abstract");
    }
}

class Dog extends Animal
{
    // Note still have to override the abstract methods in the
    // abstract class.
    @Override
    public void makeSound()
    {
        System.out.println("Bark");
        // age = 30;    ==> ERROR!    age is private to Animal
    }

    // NOTE: You will get an error if you used the
    // @Override annotation here, since java doesn't allow
    // overriding of static methods.
    // What is happening here is called METHOD HIDING.
    // Check out this SO post: http://stackoverflow.com/questions/16313649/
    public static void main(String[] args)
    {
        Dog pluto = new Dog();
        pluto.makeSound();
        pluto.eat();
        pluto.printAge();
    }
}

// Final Classes

// Final Class declaration syntax
// <access-level> final <final-class-name> {
//     // Constants and variables
//     // Method declarations
// }

// Final classes are classes that cannot be inherited from and are therefore a
// final child. In a way, final classes are the opposite of abstract classes
// because abstract classes must be extended, but final classes cannot be
// extended.
public final class SaberToothedCat extends Animal
{
    // Note still have to override the abstract methods in the
    // abstract class.
    @Override
    public void makeSound()
    {
        System.out.println("Roar");
    }
}

// Final Methods
public abstract class Mammal()
{
    // Final Method Syntax:
    // <access modifier> final <return type> <function name>(<args>)

    // Final methods, like, final classes cannot be overridden by a child
    // class, and are therefore the final implementation of the method.
    public final boolean isWarmBlooded()
    {
        return true;
    }
}

// Enum Type
//
// An enum type is a special data type that enables for a variable to be a set
// of predefined constants. The variable must be equal to one of the values
// that have been predefined for it. Because they are constants, the names of
// an enum type's fields are in uppercase letters. In the Java programming
// language, you define an enum type by using the enum keyword. For example,
// you would specify a days-of-the-week enum type as:
public enum Day {
    SUNDAY, MONDAY, TUESDAY, WEDNESDAY,
    THURSDAY, FRIDAY, SATURDAY
}

// We can use our enum Day like that:
public class EnumTest {
    // Variable Enum
    Day day;

    public EnumTest(Day day) {
        this.day = day;
    }

    public void tellItLikeItIs() {
        switch (day) {
            case MONDAY:
                System.out.println("Mondays are bad.");
                break;
            case FRIDAY:
                System.out.println("Fridays are better.");
                break;
            case SATURDAY:
            case SUNDAY:
                System.out.println("Weekends are best.");
                break;
            default:
                System.out.println("Midweek days are so-so.");
                break;
        }
    }

    public static void main(String[] args) {
        EnumTest firstDay = new EnumTest(Day.MONDAY);
        firstDay.tellItLikeItIs(); // => Mondays are bad.
        EnumTest thirdDay = new EnumTest(Day.WEDNESDAY);
        thirdDay.tellItLikeItIs(); // => Midweek days are so-so.
    }
}

// Enum types are much more powerful than we show above.
// The enum body can include methods and other fields.
// You can see more at https://docs.oracle.com/javase/tutorial/java/javaOO/enum.html

// Getting Started with Lambda Expressions
//
// New to Java version 8 are lambda expressions. Lambdas are more commonly found
// in functional programming languages, which means they are methods which can
// be created without belonging to a class, passed around as if it were itself
// an object, and executed on demand.
//
// Final note, lambdas must implement a functional interface. A functional
// interface is one which has only a single abstract method declared. It can
// have any number of default methods. Lambda expressions can be used as an
// instance of that functional interface. Any interface meeting the requirements
// is treated as a functional interface. You can read more about interfaces
// above.
//
import java.util.Map;
import java.util.HashMap;
import java.util.function.*;
import java.security.SecureRandom;

public class Lambdas {
    public static void main(String[] args) {
        // Lambda declaration syntax:
    // <zero or more parameters> -> <expression body or statement block>

        // We will use this hashmap in our examples below.
        Map<String, String> planets = new HashMap<>();
            planets.put("Mercury", "87.969");
            planets.put("Venus", "224.7");
            planets.put("Earth", "365.2564");
            planets.put("Mars", "687");
            planets.put("Jupiter", "4,332.59");
            planets.put("Saturn", "10,759");
            planets.put("Uranus", "30,688.5");
            planets.put("Neptune", "60,182");

        // Lambda with zero parameters using the Supplier functional interface
        // from java.util.function.Supplier. The actual lambda expression is
        // what comes after numPlanets =.
        Supplier<String> numPlanets = () -> Integer.toString(planets.size());
        System.out.format("Number of Planets: %s\n\n", numPlanets.get());

        // Lambda with one parameter and using the Consumer functional interface
        // from java.util.function.Consumer. This is because planets is a Map,
        // which implements both Collection and Iterable. The forEach used here,
        // found in Iterable, applies the lambda expression to each member of
        // the Collection. The default implementation of forEach behaves as if:
        /*
            for (T t : this)
                action.accept(t);
        */

        // The actual lambda expression is the parameter passed to forEach.
        planets.keySet().forEach((p) -> System.out.format("%s\n", p));

        // If you are only passing a single argument, then the above can also be
        // written as (note absent parentheses around p):
        planets.keySet().forEach(p -> System.out.format("%s\n", p));

        // Tracing the above, we see that planets is a HashMap, keySet() returns
        // a Set of its keys, forEach applies each element as the lambda
        // expression of: (parameter p) -> System.out.format("%s\n", p). Each
        // time, the element is said to be "consumed" and the statement(s)
        // referred to in the lambda body is applied. Remember the lambda body
        // is what comes after the ->.

        // The above without use of lambdas would look more traditionally like:
        for (String planet : planets.keySet()) {
            System.out.format("%s\n", planet);
        }

        // This example differs from the above in that a different forEach
        // implementation is used: the forEach found in the HashMap class
        // implementing the Map interface. This forEach accepts a BiConsumer,
        // which generically speaking is a fancy way of saying it handles
        // the Set of each Key -> Value pairs. This default implementation
        // behaves as if:
        /*
            for (Map.Entry<K, V> entry : map.entrySet())
                action.accept(entry.getKey(), entry.getValue());
        */

        // The actual lambda expression is the parameter passed to forEach.
        String orbits = "%s orbits the Sun in %s Earth days.\n";
        planets.forEach((K, V) -> System.out.format(orbits, K, V));

        // The above without use of lambdas would look more traditionally like:
        for (String planet : planets.keySet()) {
            System.out.format(orbits, planet, planets.get(planet));
        }

        // Or, if following more closely the specification provided by the
        // default implementation:
        for (Map.Entry<String, String> planet : planets.entrySet()) {
            System.out.format(orbits, planet.getKey(), planet.getValue());
        }

        // These examples cover only the very basic use of lambdas. It might not
        // seem like much or even very useful, but remember that a lambda can be
        // created as an object that can later be passed as parameters to other
        // methods.
    }
}
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
