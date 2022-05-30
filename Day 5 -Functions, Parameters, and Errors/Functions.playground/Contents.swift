//Functions let us reuse code, which means we can write a function to do something interesting then run that function from lots of places. Repeating code is a bad idea, an functions help us to avoid doing that.
//F.e we will write a function that prints help info for users of our app. We might need this anywhere in our app, so having it as a function is a good idea.

func printHelp() {
    let message = """
    Welcome to my app!
    
    Run this app inside a directory of images and MyApp will resize them all into thumbnails
    """
}

printHelp()

//Functions become more powerful when they can be customized each time u run them. Swift lets u send values to a function that can be used inside the function to change the way it behaves.
// Values sent into functions this way are called parameters.

// To make ur own functions accept parameters, give each parameter name, then a colon, then tell Swift the type of data it must be. All this goes inside the parantheses after ur function name.

//F.e we can write a function to print the square of any number:

func square (number: Int) {
    print(number * number)
}
square(number: 9)

//Returning values
//As well as receiving data, functions can also send back data, To do this, write a dash then a right angle bracket after ur functions parameter list, then tell Swift what kinda data will be returned.
//We could rewrite our square() function to return value rather than print it directly:

func square1(number: Int) -> Int {
     return number * number
}

// Now we can grab the value when the function is run and print it there:
let result = square1(number: 9)
 print(result)
// We can see the use of tuples when we need to return multiple values here.

//Parameter Labels
// We wrote our square() function like this

func square3(number: Int) -> Int {
    return number*number
}
//That names its parameter number, so we can use number inside that function to refer to it, but we must also use the name when running function like this:

let result = square3(number: 3)

//Swift let us provide two names for each parameter: one to be used used externally when calling the function . This is a simple as writing two names, separated by a space.

// To demonstrate this, here is the function that uses two names for its string parameter:

func sayHello(to name: String) {
    print("Hello, \(name)!")
    }
//The paremeter called is called to name which means externally its called to, but internally its called name. This gives variables a sensible name inside the function, but means calling the function reads naturally:

sayHello(to: "Shoh")


//Omitting parameter labels
//We might have noticed that when we call print() - we say print("Hello") rather than print(message:"Hello").
//We can get this same beahvior in our own function by using an underscore: _, for our external parameter name like this:

func greet(_ person: String) {
 print("Assalamu alaikum, \(person)!")
}
//We can now call greet() without having to use the person parameter name:

greet("Umar")
//This can make some code more natural to read, but genrally its better to give ur parameters external names to avoid the confusion.
//The print() function prints something to the screen, but always adds a new line to the end of whatever u printed, so that multiple calls to print() dont all appear on the same line.
 //You can change that behavior by add spaces rather than lines so print() has a terminator parameter that uses new line as its default value.

//you can give ur own parameters a default value just by writing an = after its type followed by default value u want to give it. So, we could write a greet() function that can optionally print nice greetings:

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no its \(person) again....")
    }
}

greet("Taylor")
greet("Taylor",nicely: false)

//Variadic functions
//Some functions are variadic, which fancy way of saying they accept any number of parameters of the same type.
//The print() function is actually variadic: if u pass a lots of parameters, they all are printed on one line with spaces between them

print("Haters", "Gonna" , "Hate")

//You can make any parameter variadic by writing ... after its type. So, an Int parameter is a single integer, whereas Int... is zero or more integers - potentialy hundreds.
// Inside the function, Swift converts the values that were passed in an array of integers, so you can loop over them as needed.

func square4(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)" )
    }
}
//Now we can run that with lots of numbers just by passing them in separated by commas:

square4(numbers: 1,4,5,6,7)

//Writing throwing functions
//Sometimes functions fail because they have bad input, or because something went wrong internally. Swift let us throw errors from functions by marking them as throws before their return type, then using the throw keyword when something goes wrong
//First we need to define an enum that decribes the errors we can throw. These must be always be based on Swifts existing Error type. Were going to write a function that checks whether a password is good, so we will throw an error is users tries an obvious "password" keyword

enum PasswordError: Error {
    case obvious
    }
//Now we will write a checkPassword() function that will throw that error if something goes wrong. This means using the throws keyword before the functions return value, then using throw PasswordError.obvious if their password is "password"

func checkPassword (_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}
//Running Throwing functions
//Swift doesnt like errors to happen when your programm runs, which means it wont let u run an error-throwing function by accident .
// Instead, you need to call these functions using three new keywords: do starts a scetion of code that might cause problems, try is used before every function that might throw an error, and catch lets u handle errors gracefully.

// if any errors are thrown inside the do block, execution immidiately jumps to the catch block. Lets try calling checkPassword() with a parameter that throws an error:

do {
    try checkPassword("password")
    print("That passsword is not good!")
} catch {
    print("U cant use that password.")
}
// When code runs, "U cant use that password  " is printed, but "That password is good " wont be - that code  will never be reached, because the error is thrown.


//All parameters passed into a Swift function are constants, so you can’t change them. If you want, you can pass in one or more parameters as inout, which means they can be changed inside your function, and those changes reflect in the original value outside the function.

//For example, if you want to double a number in place – i.e., change the value directly rather than returning a new one – you might write a function like this:

func doubleInPlace(number: inout Int) {
    number *= 2
}
//To use that, you first need to make a variable integer – you can’t use constant integers with inout, because they might be changed. You also need to pass the parameter to doubleInPlace using an ampersand, &, before its name, which is an explicit recognition that you’re aware it is being used as inout.

//In code, you’d write this:
var myNum = 10
doubleInPlace(number: &myNum)
